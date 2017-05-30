require=(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({"Pair":[function(require,module,exports){

/*

	Pair module

	See readme.md

	— Ian Bellomy, 2017
 */
var bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
  extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

exports.Pair = (function(superClass) {
  extend(Pair, superClass);

  Pair.draggedItems = [];

  function Pair(_floater, _anchor) {
    this._floater = _floater;
    this._anchor = _anchor;
    this.loopListener = bind(this.loopListener, this);
    if (!(this._floater instanceof Framer.Layer)) {
      print("ERROR - Pair module:Pair:constructor,  first argument must be a Layer.");
      return;
    }
    if (!(this._anchor instanceof Framer.Layer)) {
      print("ERROR - Pair module:Pair:constructor,  second argument must be a Layer.");
      return;
    }
    if (this._floater.parent !== this._anchor.parent) {
      print("ERROR - Pair module:Pair:constructor,  first and second arguments must have the same parent.");
      return;
    }
    this._dragAndDropEnabled = false;
    this._anchorPreviouslyIgnoredEvents = this._anchor.ignoreEvents;
    this._hoveredNode = void 0;
    this._isOverAnchor = false;
    this._dragging = false;
    this._validDragTarget = false;
    this._previousCursor = this._floater.style.cursor;
    this.useHandCursor = true;
    this._previousDraggability = false;
    this._rangeListeners = [];
    this._collisionListeners = [];
    this._tempRange = void 0;
    this._contained = false;
    this._tempListener = {};
    this._px = 0;
    this._py = 0;
    this._dSquared = this.getDistanceSquared();
    this._floatMouseDown = (function(_this) {
      return function(event, layer) {
        _this._pauseEvent(event);
        if (_this.useHandCursor) {
          return _this._floater.style.cursor = "-webkit-grabbing";
        }
      };
    })(this);
    this._floatMouseUp = (function(_this) {
      return function(event, layer) {
        _this._pauseEvent(event);
        if (_this.useHandCursor) {
          return _this._floater.style.cursor = "-webkit-grab";
        }
      };
    })(this);
    this._floatOver = (function(_this) {
      return function(event, layer) {
        return _this._pauseEvent(event);
      };
    })(this);
    this._dragStartHandler = (function(_this) {
      return function(event, layer) {
        _this._pauseEvent(event);
        _this._validDragTarget = false;
        _this._dragging = true;
        Pair.draggedItems.push(_this._floater);
        _this._floater.visible = false;
        _this._hoveredNode = document.elementFromPoint(event.clientX, event.clientY);
        _this._isOverAnchor = _this._anchor._element.contains(_this._hoveredNode);
        _this._floater.visible = true;
        return _this.emit("dragStart", _this._floater);
      };
    })(this);
    this._dragHandler = (function(_this) {
      return function(event) {
        var isNowOverAnchor, nodeUnderneath;
        _this._pauseEvent(event);
        _this._floater.visible = false;
        _this._px = event.clientX;
        _this._py = event.clientY;
        nodeUnderneath = document.elementFromPoint(event.clientX, event.clientY);
        _this._floater.visible = true;
        isNowOverAnchor = _this._anchor._element.contains(nodeUnderneath);
        if (isNowOverAnchor && !_this._isOverAnchor) {
          _this._validDragTarget = true;
          _this._isOverAnchor = true;
          _this._hoveredNode = nodeUnderneath;
          return _this.emit("dragEnter", _this._floater, _this._anchor);
        } else if (!isNowOverAnchor && _this._isOverAnchor) {
          _this._validDragTarget = false;
          _this._hoveredNode = nodeUnderneath;
          _this._isOverAnchor = false;
          return _this.emit("dragOut", _this._floater, _this._anchor);
        } else if (isNowOverAnchor && _this._isOverAnchor && _this._validDragTarget) {
          return _this.emit("dragOver", _this._floater, _this._anchor);
        }
      };
    })(this);
    this._dragEndHandler = (function(_this) {
      return function(event, layer) {
        var index;
        _this._dragging = false;
        index = Pair.draggedItems.indexOf(_this._floater);
        Pair.draggedItems.splice(index, 1);
        if (_this.useHandCursor) {
          _this._floater.style.cursor = "-webkit-grab";
        }
        if (_this._validDragTarget) {
          _this.emit("drop", _this._floater, _this._anchor);
          _this._validDragTarget = false;
        } else {
          _this.emit("invalidDrop", _this._floater);
        }
        if (_this.hitTest()) {
          return _this.emit("contactDrop", _this._floater, _this._anchor);
        } else {
          return _this.emit("invalidContactDrop", _this._floater);
        }
      };
    })(this);
    this._floatMoveHandler = (function(_this) {
      return function(event, layer) {
        return _this._pauseEvent(event);
      };
    })(this);
    this.wake();
  }

  Pair.prototype._pauseEvent = function(event) {
    event.stopPropagation();
    event.preventDefault();
    event.cancelBubble = true;
    return event.returnValue = false;
  };

  Pair.prototype.loopListener = function() {
    var i, j, k, len, len1, len2, ref, ref1, ref2, ref3, results, results1;
    this._dSquared = this.getDistanceSquared();
    ref = this._rangeListeners;
    for (i = 0, len = ref.length; i < len; i++) {
      this._tempRange = ref[i];
      this._contained = (this._tempRange.minSquared <= (ref1 = this._dSquared) && ref1 <= this._tempRange.maxSquared);
      if (this._contained && !this._tempRange.entered) {
        this._tempRange.entered = true;
        this._tempRange.enterCallback.apply(this);
      } else if (!this._contained && this._tempRange.entered) {
        this._tempRange.entered = false;
        this._tempRange.exitCallback.apply(this);
      }
    }
    if (this.hitTest()) {
      ref2 = this._collisionListeners;
      results = [];
      for (j = 0, len1 = ref2.length; j < len1; j++) {
        this._tempListener = ref2[j];
        results.push(this._tempListener.contact++ || this._tempListener.contactStart(this._floater, this._anchor));
      }
      return results;
    } else {
      ref3 = this._collisionListeners;
      results1 = [];
      for (k = 0, len2 = ref3.length; k < len2; k++) {
        this._tempListener = ref3[k];
        if (this._tempListener.contact) {
          this._tempListener.contact = false;
          results1.push(this._tempListener.contactEnd(this._floater, this._anchor));
        } else {
          results1.push(void 0);
        }
      }
      return results1;
    }
  };

  Pair.prototype.getDistance = function() {
    return Math.sqrt(Math.pow(this._floater.midX - this._anchor.midX, 2) + Math.pow(this._floater.midY - this._anchor.midY, 2));
  };

  Pair.prototype.getDistanceSquared = function() {
    return Math.pow(this._floater.midX - this._anchor.midX, 2) + Math.pow(this._floater.midY - this._anchor.midY, 2);
  };

  Pair.prototype.setDistance = function(newDistance) {
    var distanceDiffRatio, newXOffset, newYOffset, oldXOffset, oldYOffset;
    distanceDiffRatio = newDistance / Math.sqrt(this._dSquared);
    oldXOffset = this._floater.midX - this._anchor.midX;
    newXOffset = oldXOffset * distanceDiffRatio;
    this._floater.midX = this._anchor.midX + newXOffset;
    oldYOffset = this._floater.midY - this._anchor.midY;
    newYOffset = oldYOffset * distanceDiffRatio;
    return this._floater.midY = this._anchor.midY + newYOffset;
  };

  Pair.prototype.midpoint = function() {
    return [(this._anchor.midX + this._floater.midX) / 2.0, (this._anchor.midY + this._floater.midY) / 2.0];
  };

  Pair.prototype.hitTest = function() {
    var r1, r2;
    r1 = this._anchor;
    r2 = this._floater;
    return !(r2.x > r1.x + r1.width || r2.x + r2.width < r1.x || r2.y > r1.y + r1.height || r2.y + r2.height < r1.y);
  };

  Pair.prototype.enableDragAndDrop = function() {
    this._dragAndDropEnabled = true;
    this._previousDraggability = this._floater.draggable.enabled;
    this._floater.draggable.enabled = true;
    this._previousCursor = this._floater.style.cursor;
    if (this.useHandCursor) {
      this._floater.style.cursor = "-webkit-grab";
    }
    this._hoveredNode = void 0;
    this._anchorPreviouslyIgnoredEvents = this._anchor.ignoreEvents;
    this._anchor.ignoreEvents = false;
    this._floater.on(Events.MouseDown, this._floatMouseDown);
    this._floater.on(Events.MouseUp, this._floatMouseUp);
    this._floater.on(Events.MouseMove, this._floatMoveHandler);
    this._floater.on(Events.MouseOver, this._floatOver);
    this._floater.on(Events.DragStart, this._dragStartHandler);
    this._floater.on(Events.DragMove, this._dragHandler);
    return this._floater.on(Events.DragEnd, this._dragEndHandler);
  };

  Pair.prototype.disableDragAndDrop = function() {
    this._dragging = false;
    this._dragAndDropEnabled = false;
    this._floater.draggable.enabled = false;
    if (this.useHandCursor) {
      this._floater.style.cursor = this._previousCursor;
    }
    this._anchor.ignoreEvents = this._anchorPreviouslyIgnoredEvents;
    this._floater.off(Events.MouseDown, this._floatMouseDown);
    this._floater.off(Events.MouseUp, this._floatMouseUp);
    this._floater.off(Events.MouseMove, this._floatMoveHandler);
    this._floater.off(Events.MouseOver, this._floatOver);
    this._floater.off(Events.DragStart, this._dragStartHandler);
    this._floater.off(Events.DragMove, this._dragHandler);
    return this._floater.off(Events.DragEnd, this._dragEndHandler);
  };

  Pair.prototype.sleep = function() {
    return Framer.Loop.off("update", this.loopListener);
  };

  Pair.prototype.wake = function() {
    return Framer.Loop.on("update", this.loopListener);
  };

  Pair.prototype.destroy = function() {
    this.disableDragAndDrop();
    return this.sleep();
  };

  Pair.prototype.onRangeChange = function(min, max, enterFn, exitFn) {
    var count;
    if (exitFn == null) {
      exitFn = function() {};
    }
    count = this._rangeListeners.push({
      min: min,
      max: max,
      minSquared: Math.pow(min, 2),
      maxSquared: Math.pow(max, 2),
      enterCallback: enterFn,
      exitCallback: exitFn,
      entered: false
    });
    return count - 1;
  };

  Pair.prototype.offRangeChange = function(index) {
    if (!(index instanceof Number)) {
      print("ERROR - Pair:offRangeChange(index), index must be a Number");
      return;
    }
    return this._rangeListeners[index] = null;
  };

  Pair.prototype.onContactChange = function(startFn, endFn) {
    var count;
    if (endFn == null) {
      endFn = function() {};
    }
    count = (this._collisionListeners.push({
      contactStart: startFn,
      contactEnd: endFn,
      contact: false
    })) - 1;
    return count;
  };

  Pair.prototype.offContactChange = function(index) {
    if (!(index instanceof Number)) {
      print("ERROR - Pair:offContactChange(index), index must be a Number");
      return;
    }
    return this._collisionListeners[index] = null;
  };

  Pair.prototype.onDragStart = function(fn) {
    return this.on("dragStart", fn);
  };

  Pair.prototype.onDragEnter = function(fn) {
    return this.on("dragEnter", fn);
  };

  Pair.prototype.onDragOver = function(fn) {
    return this.on("dragOver", fn);
  };

  Pair.prototype.onDragLeave = function(fn) {
    return this.on("dragOut", fn);
  };

  Pair.prototype.onDragOut = function(fn) {
    return this.on("dragOut", fn);
  };

  Pair.prototype.onInvalidDrop = function(fn) {
    return this.on("invalidDrop", fn);
  };

  Pair.prototype.onDrop = function(fn) {
    return this.on("drop", fn);
  };

  Pair.prototype.onContactDrop = function(fn) {
    return this.on("contactDrop", fn);
  };

  Pair.prototype.onInvalidContactDrop = function(fn) {
    return this.on("invalidContactDrop", fn);
  };

  return Pair;

})(Framer.EventEmitter);


},{}]},{},[])
//# sourceMappingURL=data:application/json;charset=utf-8;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiZnJhbWVyLm1vZHVsZXMuanMiLCJzb3VyY2VzIjpbIi4uLy4uLy4uLy4uLy4uL1VzZXJzL2lhbmJlbGxvbXkvRG9jdW1lbnRzL0RBQVAvMjAxNi0yMDE3IFMzIFN1bW1lci9JbnRlcmFjdGlvbiBEZXNpZ24gSUkvX3RlbXBFeGFtcGxlcy9EcmFnIEFuZCBEcm9wLmZyYW1lci9tb2R1bGVzL1BhaXIuY29mZmVlIiwibm9kZV9tb2R1bGVzL2Jyb3dzZXItcGFjay9fcHJlbHVkZS5qcyJdLCJzb3VyY2VzQ29udGVudCI6WyIjIyNcblxuXHRQYWlyIG1vZHVsZVxuXG5cdFNlZSByZWFkbWUubWRcblxuXHTigJQgSWFuIEJlbGxvbXksIDIwMTdcblx0XG4jIyNcblxuY2xhc3MgZXhwb3J0cy5QYWlyIGV4dGVuZHMgRnJhbWVyLkV2ZW50RW1pdHRlclxuXG5cdCMgc3RhdGljIHByb3BlcnRpZXNcblxuXHRAZHJhZ2dlZEl0ZW1zOltdXHRcdFx0XG5cblx0Y29uc3RydWN0b3I6IChAX2Zsb2F0ZXIsIEBfYW5jaG9yKSAtPlx0XHRcblxuXHRcdCMgdmFsaWRhdGVcblx0XHRpZiAhKEBfZmxvYXRlciBpbnN0YW5jZW9mIEZyYW1lci5MYXllcilcblx0XHRcdHByaW50IFwiRVJST1IgLSBQYWlyIG1vZHVsZTpQYWlyOmNvbnN0cnVjdG9yLCAgZmlyc3QgYXJndW1lbnQgbXVzdCBiZSBhIExheWVyLlwiXG5cdFx0XHRyZXR1cm5cblxuXHRcdGlmICEoQF9hbmNob3IgaW5zdGFuY2VvZiBGcmFtZXIuTGF5ZXIpXG5cdFx0XHRwcmludCBcIkVSUk9SIC0gUGFpciBtb2R1bGU6UGFpcjpjb25zdHJ1Y3RvciwgIHNlY29uZCBhcmd1bWVudCBtdXN0IGJlIGEgTGF5ZXIuXCJcblx0XHRcdHJldHVyblxuXG5cdFx0aWYgQF9mbG9hdGVyLnBhcmVudCAhPSBAX2FuY2hvci5wYXJlbnRcblx0XHRcdHByaW50IFwiRVJST1IgLSBQYWlyIG1vZHVsZTpQYWlyOmNvbnN0cnVjdG9yLCAgZmlyc3QgYW5kIHNlY29uZCBhcmd1bWVudHMgbXVzdCBoYXZlIHRoZSBzYW1lIHBhcmVudC5cIlxuXHRcdFx0cmV0dXJuXG5cblx0XHQjICdwcml2YXRlJyBwcm9wZXJ0aWVzXHRcdFxuXHRcdEBfZHJhZ0FuZERyb3BFbmFibGVkIFx0ID0gZmFsc2Vcblx0XHRAX2FuY2hvclByZXZpb3VzbHlJZ25vcmVkRXZlbnRzID0gQF9hbmNob3IuaWdub3JlRXZlbnRzXG5cdFx0QF9ob3ZlcmVkTm9kZSBcdFx0XHQ9IHVuZGVmaW5lZFxuXHRcdEBfaXNPdmVyQW5jaG9yXHRcdFx0PSBmYWxzZVx0XHRcdCMgYXJlIHdlIG92ZXIgdGhpcyBhbmNob3Jcblx0XHRAX2RyYWdnaW5nIFx0XHRcdFx0PSBmYWxzZVxuXHRcdEBfdmFsaWREcmFnVGFyZ2V0IFx0XHQ9IGZhbHNlXHRcdFx0IyBhcmUgd2Ugb3ZlciBhbnkgdmFsaWQgYW5jaG9yIC8gZHJvcCB0YXJnZXRcblx0XHRAX3ByZXZpb3VzQ3Vyc29yIFx0XHQ9IEBfZmxvYXRlci5zdHlsZS5jdXJzb3Jcblx0XHRAdXNlSGFuZEN1cnNvclx0XHRcdD0gdHJ1ZVxuXHRcdEBfcHJldmlvdXNEcmFnZ2FiaWxpdHkgXHQ9IGZhbHNlXG5cdFx0QF9yYW5nZUxpc3RlbmVycyBcdFx0PSBbXVx0XHRcblx0XHRAX2NvbGxpc2lvbkxpc3RlbmVycyBcdD0gW11cdFxuXHRcdEBfdGVtcFJhbmdlIFx0XHRcdD0gdW5kZWZpbmVkXG5cdFx0QF9jb250YWluZWQgXHRcdFx0PSBmYWxzZVxuXHRcdEBfdGVtcExpc3RlbmVyIFx0XHRcdD0ge31cdFx0XG5cdFx0QF9weFx0XHRcdFx0XHQ9IDBcblx0XHRAX3B5IFx0XHRcdFx0XHQ9IDBcblx0XHRAX2RTcXVhcmVkID0gQGdldERpc3RhbmNlU3F1YXJlZCgpXG5cdFx0XG5cdFx0IyBXZSB3YW50IHRoZXNlIGV2ZW50IGhhbmRsZXIgbWV0aG9kcyB0byBiZSBzY29wZWQgdG8gdGhlIFBhaXIgaW5zdGFuY2Ugd2hlbiB0aGV5IHJ1biwgc28gdGhleSdyZSBoZXJlXG5cdFx0QF9mbG9hdE1vdXNlRG93biA9IChldmVudCxsYXllcik9PlxuXHRcdFx0QF9wYXVzZUV2ZW50KGV2ZW50KVxuXHRcdFx0aWYgQHVzZUhhbmRDdXJzb3IgdGhlbiBAX2Zsb2F0ZXIuc3R5bGUuY3Vyc29yID0gXCItd2Via2l0LWdyYWJiaW5nXCJcblx0XHRcblx0XHRAX2Zsb2F0TW91c2VVcCA9IChldmVudCxsYXllcik9Plx0XHRcdFxuXHRcdFx0QF9wYXVzZUV2ZW50KGV2ZW50KVxuXHRcdFx0aWYgQHVzZUhhbmRDdXJzb3IgdGhlbiBAX2Zsb2F0ZXIuc3R5bGUuY3Vyc29yID0gXCItd2Via2l0LWdyYWJcIlxuXHRcdFx0XG5cdFx0QF9mbG9hdE92ZXIgPSAoZXZlbnQsbGF5ZXIpID0+XHRcdFx0XG5cdFx0XHRAX3BhdXNlRXZlbnQoZXZlbnQpXG5cdFx0XG5cdFx0QF9kcmFnU3RhcnRIYW5kbGVyPSAoZXZlbnQsbGF5ZXIpID0+XHRcdFx0XG5cdFx0XHRAX3BhdXNlRXZlbnQoZXZlbnQpXHRcdFx0XG5cdFx0XHRAX3ZhbGlkRHJhZ1RhcmdldCA9IGZhbHNlXHRcdFx0XG5cdFx0XHRAX2RyYWdnaW5nID0gdHJ1ZVxuXHRcdFx0UGFpci5kcmFnZ2VkSXRlbXMucHVzaCBAX2Zsb2F0ZXJcblx0XHRcdCMgQF9mbG9hdGVyLnN0eWxlLnBvaW50ZXJFdmVudHMgPSBcIm5vbmVcIlxuXHRcdFx0QF9mbG9hdGVyLnZpc2libGUgPSBmYWxzZVxuXHRcdFx0QF9ob3ZlcmVkTm9kZSA9IGRvY3VtZW50LmVsZW1lbnRGcm9tUG9pbnQoZXZlbnQuY2xpZW50WCwgZXZlbnQuY2xpZW50WSlcdFx0XHRcblx0XHRcdEBfaXNPdmVyQW5jaG9yID0gQF9hbmNob3IuX2VsZW1lbnQuY29udGFpbnMoQF9ob3ZlcmVkTm9kZSlcblx0XHRcdEBfZmxvYXRlci52aXNpYmxlID0gdHJ1ZVxuXHRcdFx0QGVtaXQgXCJkcmFnU3RhcnRcIiwgQF9mbG9hdGVyXG5cdFxuXHRcdEBfZHJhZ0hhbmRsZXI9KGV2ZW50KSA9PlxuXHRcdFx0QF9wYXVzZUV2ZW50KGV2ZW50KVx0XHRcdFxuXHRcdFx0QF9mbG9hdGVyLnZpc2libGUgPSBmYWxzZVxuXHRcdFx0QF9weCA9IGV2ZW50LmNsaWVudFhcblx0XHRcdEBfcHkgPSBldmVudC5jbGllbnRZXG5cdFx0XHRub2RlVW5kZXJuZWF0aCA9IGRvY3VtZW50LmVsZW1lbnRGcm9tUG9pbnQoZXZlbnQuY2xpZW50WCwgZXZlbnQuY2xpZW50WSlcblx0XHRcdEBfZmxvYXRlci52aXNpYmxlID0gdHJ1ZVxuXHRcdFx0aXNOb3dPdmVyQW5jaG9yID0gQF9hbmNob3IuX2VsZW1lbnQuY29udGFpbnMobm9kZVVuZGVybmVhdGgpXHRcdFx0XG5cdFx0XHRpZiBpc05vd092ZXJBbmNob3IgYW5kIG5vdCBAX2lzT3ZlckFuY2hvclxuXHRcdFx0XHRAX3ZhbGlkRHJhZ1RhcmdldCA9IHRydWVcdFx0XHRcdFx0XG5cdFx0XHRcdEBfaXNPdmVyQW5jaG9yID0gdHJ1ZVxuXHRcdFx0XHRAX2hvdmVyZWROb2RlID0gbm9kZVVuZGVybmVhdGhcdFx0XHRcdFxuXHRcdFx0XHRAZW1pdCBcImRyYWdFbnRlclwiLCBAX2Zsb2F0ZXIsIEBfYW5jaG9yXG5cdFx0XHRlbHNlIGlmIG5vdCBpc05vd092ZXJBbmNob3IgYW5kIEBfaXNPdmVyQW5jaG9yXG5cdFx0XHRcdEBfdmFsaWREcmFnVGFyZ2V0ID0gZmFsc2VcdFx0XHRcdFxuXHRcdFx0XHRAX2hvdmVyZWROb2RlID0gbm9kZVVuZGVybmVhdGhcblx0XHRcdFx0QF9pc092ZXJBbmNob3IgPSBmYWxzZVxuXHRcdFx0XHRAZW1pdCBcImRyYWdPdXRcIiwgQF9mbG9hdGVyLCBAX2FuY2hvclxuXHRcdFx0ZWxzZSBpZiBpc05vd092ZXJBbmNob3IgYW5kIEBfaXNPdmVyQW5jaG9yIGFuZCBAX3ZhbGlkRHJhZ1RhcmdldFxuXHRcdFx0XHRAZW1pdCBcImRyYWdPdmVyXCIsIEBfZmxvYXRlciwgQF9hbmNob3Jcblx0XG5cdFx0QF9kcmFnRW5kSGFuZGxlcj0oZXZlbnQsIGxheWVyKSA9PlxuXHRcdFx0QF9kcmFnZ2luZyA9IGZhbHNlXHRcdFx0XG5cdFx0XHRpbmRleCA9IFBhaXIuZHJhZ2dlZEl0ZW1zLmluZGV4T2YgQF9mbG9hdGVyXG5cdFx0XHRQYWlyLmRyYWdnZWRJdGVtcy5zcGxpY2UoaW5kZXgsMSlcblx0XHRcdGlmIEB1c2VIYW5kQ3Vyc29yIHRoZW4gQF9mbG9hdGVyLnN0eWxlLmN1cnNvciA9IFwiLXdlYmtpdC1ncmFiXCJcblx0XHRcdGlmIEBfdmFsaWREcmFnVGFyZ2V0XHRcdFx0XHRcblx0XHRcdFx0QGVtaXQgXCJkcm9wXCIsIEBfZmxvYXRlciwgQF9hbmNob3Jcblx0XHRcdFx0QF92YWxpZERyYWdUYXJnZXQgPSBmYWxzZVxuXHRcdFx0ZWxzZVx0XHRcdFxuXHRcdFx0XHRAZW1pdCBcImludmFsaWREcm9wXCIsIEBfZmxvYXRlclxuXHRcblx0XHRcdGlmIEBoaXRUZXN0KClcblx0XHRcdFx0QGVtaXQgXCJjb250YWN0RHJvcFwiLCBAX2Zsb2F0ZXIsIEBfYW5jaG9yXG5cdFx0XHRlbHNlIFxuXHRcdFx0XHRAZW1pdCBcImludmFsaWRDb250YWN0RHJvcFwiLCBAX2Zsb2F0ZXJcblx0XHRcdFx0XG5cdFx0QF9mbG9hdE1vdmVIYW5kbGVyID0gKGV2ZW50LGxheWVyKSA9PlxuXHRcdFx0QF9wYXVzZUV2ZW50KGV2ZW50KVxuXHRcdFx0XG4jIFx0XHRAX2FuY2hvck1vdXNlT3Zlcj0oZXZlbnQsbGF5ZXIpPT5cbiMgXHRcdFx0aWYgQF9kcmFnZ2luZyAgXG4jIFx0XHRcdFx0bm9kZVVuZGVybmVhdGggPSBkb2N1bWVudC5lbGVtZW50RnJvbVBvaW50KGV2ZW50LmNsaWVudFgsIGV2ZW50LmNsaWVudFkpXG4jIFx0XHRcdFx0aWYgUGFpci5kcmFnZ2VkSXRlbXMuaW5kZXhPZiBAX2Zsb2F0ZXIgaXNudCAtMSBhbmQgQF9ob3ZlcmVkTm9kZSAhPSBub2RlVW5kZXJuZWF0aFxuIyBcdFx0XHRcdFx0QF92YWxpZERyYWdUYXJnZXQgPSB0cnVlXG4jIFx0XHRcdFx0XHRAX2hvdmVyZWROb2RlID0gbm9kZVVuZGVybmVhdGhcbiMgXHRcdFx0XHRcdHByaW50IFwibmV3IG5vZGU/XCJcbiMgXHRcdFx0XHRcdHByaW50IEBfaG92ZXJlZE5vZGUgPT0gbm9kZVVuZGVybmVhdGhcbiMgXHRcdFx0XHRcdEBlbWl0IFwiZHJhZ0VudGVyXCIsIEBfZmxvYXRlciwgQF9hbmNob3JcbiMgXHRcdFx0XHRcdFxuIyBcdFxuIyBcdFx0QF9hbmNob3JNb3VzZU91dD0oZXZlbnQsbGF5ZXIpPT5cdFx0XG4jIFx0XHRcdEBfcGF1c2VFdmVudChldmVudClcbiMgXHRcdFx0aWYgQF9kcmFnZ2luZyBcbiMgXHRcdFx0XHRpZiBQYWlyLmRyYWdnZWRJdGVtcy5pbmRleE9mIEBfZmxvYXRlciBpc250IC0xXG4jIFx0XHRcdFx0XHRAX3ZhbGlkRHJhZ1RhcmdldCA9IGZhbHNlXG4jIFx0XHRcdFx0XHRAX2hvdmVyZWROb2RlID0gZG9jdW1lbnQuZWxlbWVudEZyb21Qb2ludChldmVudC5jbGllbnRYLCBldmVudC5jbGllbnRZKVxuIyBcdFx0XHRcdFx0QGVtaXQgXCJkcmFnT3V0XCIsIEBfZmxvYXRlciwgQF9hbmNob3JcblxuXHRcdFxuXHRcdCMgcmVhZHkhXG5cdFx0QHdha2UoKVxuXHRcdFxuXHRcdCNcblx0XHQjIGVuZCBjb25zdHJ1Y3RvclxuXHRcdCNcblx0XG5cblx0X3BhdXNlRXZlbnQ6KGV2ZW50KS0+XG5cdFx0ZXZlbnQuc3RvcFByb3BhZ2F0aW9uKClcblx0XHRldmVudC5wcmV2ZW50RGVmYXVsdCgpXG5cdFx0ZXZlbnQuY2FuY2VsQnViYmxlPXRydWVcblx0XHRldmVudC5yZXR1cm5WYWx1ZT1mYWxzZVxuXHRcdFxuXHQjc2hvdWxkIG11bHRpcGxlIFBhaXJzIGJlIGhhbmRsZWQgaW4gdGhlIHNhbWUgbGlzdGVuZXI/XG5cdGxvb3BMaXN0ZW5lcjogPT5cblx0XHRAX2RTcXVhcmVkID0gQGdldERpc3RhbmNlU3F1YXJlZCgpXG5cdFx0Zm9yIEBfdGVtcFJhbmdlIGluIEBfcmFuZ2VMaXN0ZW5lcnMgIFxuXHRcdFx0QF9jb250YWluZWQgPSBAX3RlbXBSYW5nZS5taW5TcXVhcmVkIDw9IEBfZFNxdWFyZWQgPD0gQF90ZW1wUmFuZ2UubWF4U3F1YXJlZCBcblx0XHRcdGlmIEBfY29udGFpbmVkIGFuZCBub3QgQF90ZW1wUmFuZ2UuZW50ZXJlZCBcblx0XHRcdFx0QF90ZW1wUmFuZ2UuZW50ZXJlZCA9IHRydWVcblx0XHRcdFx0QF90ZW1wUmFuZ2UuZW50ZXJDYWxsYmFjay5hcHBseSBAXG5cdFx0XHRcdFxuXHRcdFx0ZWxzZSBpZiBub3QgQF9jb250YWluZWQgYW5kIEBfdGVtcFJhbmdlLmVudGVyZWRcblx0XHRcdFx0QF90ZW1wUmFuZ2UuZW50ZXJlZCA9IGZhbHNlXG5cdFx0XHRcdEBfdGVtcFJhbmdlLmV4aXRDYWxsYmFjay5hcHBseSBAXHRcdFx0XG5cblx0XHRpZiBAaGl0VGVzdCgpXG5cdFx0XHRmb3IgQF90ZW1wTGlzdGVuZXIgaW4gQF9jb2xsaXNpb25MaXN0ZW5lcnNcblx0XHRcdFx0QF90ZW1wTGlzdGVuZXIuY29udGFjdCsrIHx8IEBfdGVtcExpc3RlbmVyLmNvbnRhY3RTdGFydChAX2Zsb2F0ZXIsQF9hbmNob3IpXG5cdFx0XHRcdFxuXHRcdGVsc2Vcblx0XHRcdGZvciBAX3RlbXBMaXN0ZW5lciBpbiBAX2NvbGxpc2lvbkxpc3RlbmVyc1xuXHRcdFx0XHRpZihAX3RlbXBMaXN0ZW5lci5jb250YWN0KVxuXHRcdFx0XHRcdEBfdGVtcExpc3RlbmVyLmNvbnRhY3QgPSBmYWxzZVxuXHRcdFx0XHRcdEBfdGVtcExpc3RlbmVyLmNvbnRhY3RFbmQoQF9mbG9hdGVyLEBfYW5jaG9yKVxuXHRcdFxuXHRcdFxuXHRcdCMgcmVxdWVzdEFuaW1hdGlvbkZyYW1lKEBsb29wTGlzdGVuZXIpXG5cdFxuXHRnZXREaXN0YW5jZTogLT5cblx0XHRyZXR1cm4gTWF0aC5zcXJ0KChAX2Zsb2F0ZXIubWlkWC1AX2FuY2hvci5taWRYKSoqMiArIChAX2Zsb2F0ZXIubWlkWS1AX2FuY2hvci5taWRZKSoqMilcblx0XG5cdGdldERpc3RhbmNlU3F1YXJlZDogLT5cblx0XHRyZXR1cm4gKEBfZmxvYXRlci5taWRYLUBfYW5jaG9yLm1pZFgpKioyICsgKEBfZmxvYXRlci5taWRZLUBfYW5jaG9yLm1pZFkpKioyXG5cdFxuXHRzZXREaXN0YW5jZToobmV3RGlzdGFuY2UpLT5cblx0XHRkaXN0YW5jZURpZmZSYXRpbyA9IG5ld0Rpc3RhbmNlLyBNYXRoLnNxcnQoQF9kU3F1YXJlZClcblxuXHRcdG9sZFhPZmZzZXQgPSBAX2Zsb2F0ZXIubWlkWCAtIEBfYW5jaG9yLm1pZFhcblx0XHRuZXdYT2Zmc2V0ID0gb2xkWE9mZnNldCAqIGRpc3RhbmNlRGlmZlJhdGlvXG5cdFx0QF9mbG9hdGVyLm1pZFggPSBAX2FuY2hvci5taWRYICsgbmV3WE9mZnNldFxuXG5cdFx0b2xkWU9mZnNldCA9IEBfZmxvYXRlci5taWRZIC0gQF9hbmNob3IubWlkWVxuXHRcdG5ld1lPZmZzZXQgPSBvbGRZT2Zmc2V0ICogZGlzdGFuY2VEaWZmUmF0aW9cblx0XHRAX2Zsb2F0ZXIubWlkWSA9IEBfYW5jaG9yLm1pZFkgKyBuZXdZT2Zmc2V0XG5cblx0XG5cdCMgdGhlIGNvLW9yZGluYXRlcyBiZXR3ZWVuIHRoZSBhbmNob3IgYW5kIGZsb2F0ZXJcblx0bWlkcG9pbnQ6IC0+XG5cdFx0cmV0dXJuIFsoQF9hbmNob3IubWlkWCArIEBfZmxvYXRlci5taWRYKS8yLjAsKEBfYW5jaG9yLm1pZFkgKyBAX2Zsb2F0ZXIubWlkWSkvMi4wXVxuXHRcblx0I3JldHVybnMgdHJ1ZSBpZiB0aGUgYW5jaG9yIGFuZCBmbG9hdGVyIGZyYW1lcyB0b3VjaFx0XHRcblx0aGl0VGVzdDotPlxuXHRcdHIxID0gQF9hbmNob3Jcblx0XHRyMiA9IEBfZmxvYXRlclxuXHRcdHJldHVybiAhKCByMi54ID4gcjEueCArIHIxLndpZHRoIG9yIHIyLnggKyByMi53aWR0aCA8IHIxLnggb3IgcjIueSA+IHIxLnkgKyByMS5oZWlnaHQgb3IgcjIueSArIHIyLmhlaWdodCA8IHIxLnkpXG5cblx0ZW5hYmxlRHJhZ0FuZERyb3A6LT5cdFx0XG5cdFx0QF9kcmFnQW5kRHJvcEVuYWJsZWQgPSB0cnVlXHRcdFxuXHRcdEBfcHJldmlvdXNEcmFnZ2FiaWxpdHkgPSBAX2Zsb2F0ZXIuZHJhZ2dhYmxlLmVuYWJsZWQgIyBGSVhNRTogQnVnIGluIGZyYW1lciBtYWtlcyB0aGlzIHJldHVybiB0cnVlIGlmIGFjY2Vzc2VkIVxuXHRcdEBfZmxvYXRlci5kcmFnZ2FibGUuZW5hYmxlZCA9IHRydWVcblx0XHRAX3ByZXZpb3VzQ3Vyc29yID0gQF9mbG9hdGVyLnN0eWxlLmN1cnNvclxuXHRcdGlmIEB1c2VIYW5kQ3Vyc29yIHRoZW4gQF9mbG9hdGVyLnN0eWxlLmN1cnNvciA9IFwiLXdlYmtpdC1ncmFiXCJcblx0XHRAX2hvdmVyZWROb2RlID0gdW5kZWZpbmVkXG5cdFx0QF9hbmNob3JQcmV2aW91c2x5SWdub3JlZEV2ZW50cyA9IEBfYW5jaG9yLmlnbm9yZUV2ZW50c1xuXHRcdEBfYW5jaG9yLmlnbm9yZUV2ZW50cyA9IGZhbHNlXG5cdFx0XG5cdFx0QF9mbG9hdGVyLm9uIEV2ZW50cy5Nb3VzZURvd24sIEBfZmxvYXRNb3VzZURvd25cblx0XHRAX2Zsb2F0ZXIub24gRXZlbnRzLk1vdXNlVXAsIEBfZmxvYXRNb3VzZVVwXG5cdFx0QF9mbG9hdGVyLm9uIEV2ZW50cy5Nb3VzZU1vdmUsIEBfZmxvYXRNb3ZlSGFuZGxlclx0XHRcblx0XHRAX2Zsb2F0ZXIub24gRXZlbnRzLk1vdXNlT3ZlciwgQF9mbG9hdE92ZXJcdFxuXHRcdEBfZmxvYXRlci5vbiBFdmVudHMuRHJhZ1N0YXJ0LCBAX2RyYWdTdGFydEhhbmRsZXJcblx0XHRAX2Zsb2F0ZXIub24gRXZlbnRzLkRyYWdNb3ZlLCBAX2RyYWdIYW5kbGVyXG5cdFx0QF9mbG9hdGVyLm9uIEV2ZW50cy5EcmFnRW5kLCBAX2RyYWdFbmRIYW5kbGVyXHRcdFxuXG5cdGRpc2FibGVEcmFnQW5kRHJvcDotPlx0XG5cdFx0QF9kcmFnZ2luZyA9IGZhbHNlXHRcblx0XHRAX2RyYWdBbmREcm9wRW5hYmxlZCA9IGZhbHNlXHRcdFxuXHRcdEBfZmxvYXRlci5kcmFnZ2FibGUuZW5hYmxlZCA9IGZhbHNlICMgQF9wcmV2aW91c0RyYWdnYWJpbGl0eSAjIERvZXNuJ3Qgd29yayBiZWNhdXNlIGJ1ZyBpbiBmcmFtZXJcblx0XHRpZiBAdXNlSGFuZEN1cnNvciB0aGVuIEBfZmxvYXRlci5zdHlsZS5jdXJzb3IgPSBAX3ByZXZpb3VzQ3Vyc29yXG5cdFx0QF9hbmNob3IuaWdub3JlRXZlbnRzID0gQF9hbmNob3JQcmV2aW91c2x5SWdub3JlZEV2ZW50c1xuXG5cdFx0QF9mbG9hdGVyLm9mZiBFdmVudHMuTW91c2VEb3duLCBAX2Zsb2F0TW91c2VEb3duXG5cdFx0QF9mbG9hdGVyLm9mZiBFdmVudHMuTW91c2VVcCwgQF9mbG9hdE1vdXNlVXBcblx0XHRAX2Zsb2F0ZXIub2ZmIEV2ZW50cy5Nb3VzZU1vdmUsIEBfZmxvYXRNb3ZlSGFuZGxlclxuXHRcdEBfZmxvYXRlci5vZmYgRXZlbnRzLk1vdXNlT3ZlciwgQF9mbG9hdE92ZXJcdFxuXHRcdEBfZmxvYXRlci5vZmYgRXZlbnRzLkRyYWdTdGFydCwgQF9kcmFnU3RhcnRIYW5kbGVyXG5cdFx0QF9mbG9hdGVyLm9mZiBFdmVudHMuRHJhZ01vdmUsIEBfZHJhZ0hhbmRsZXJcblx0XHRAX2Zsb2F0ZXIub2ZmIEV2ZW50cy5EcmFnRW5kLCBAX2RyYWdFbmRIYW5kbGVyXHRcdFxuXHRcdFxuXG5cdHNsZWVwOi0+XG5cdFx0RnJhbWVyLkxvb3Aub2ZmIFwidXBkYXRlXCIsIEBsb29wTGlzdGVuZXJcblx0XHQjIGRpc2FibGUgZHJhZyBhbmQgZHJvcCwgcmVtZW1iZXIgd2hhdCB0aGUgc3RhdGUgd2FzXG5cblx0d2FrZTotPlxuXHRcdCMgcmVxdWVzdEFuaW1hdGlvbkZyYW1lKEBsb29wTGlzdGVuZXIpXG5cblx0XHRGcmFtZXIuTG9vcC5vbiBcInVwZGF0ZVwiLCBAbG9vcExpc3RlbmVyXG5cblx0XHQjIHVwZGF0ZSBjb250YWN0IHByb3BlcnRpZXMgb2YgbGlzdGVuZXJzP1xuXHRcdCMgZW5hYmxlZCBkcmFnIGFuZCBkcm9wIGlmIHRoaXMgd2FzIGFjdGl2ZSBiZWZvcmVcblxuXHRkZXN0cm95Oi0+XG5cdFx0QGRpc2FibGVEcmFnQW5kRHJvcCgpXG5cdFx0QHNsZWVwKClcblx0XHQjIHRoYXQncyBpdCEgSSB0aGluay4uLlxuXG5cblx0I1xuXHQjXHRFdmVudCBIYW5kbGluZ1xuXHQjXG5cblx0I3JldHVybnMgYW4gaW5kZXhcblx0b25SYW5nZUNoYW5nZTogKG1pbixtYXgsZW50ZXJGbixleGl0Rm4gPSAtPikgLT5cblx0XHRjb3VudCA9IEBfcmFuZ2VMaXN0ZW5lcnMucHVzaFxuXHRcdFx0bWluOm1pblxuXHRcdFx0bWF4Om1heFxuXHRcdFx0bWluU3F1YXJlZDogbWluKioyXG5cdFx0XHRtYXhTcXVhcmVkOiBtYXgqKjJcblx0XHRcdGVudGVyQ2FsbGJhY2s6IGVudGVyRm5cblx0XHRcdGV4aXRDYWxsYmFjazogZXhpdEZuXG5cdFx0XHRlbnRlcmVkOmZhbHNlXG5cdFx0XG5cdFx0cmV0dXJuIGNvdW50IC0gMVxuXG5cblx0b2ZmUmFuZ2VDaGFuZ2U6IChpbmRleCkgLT5cblx0XHRpZiAhKGluZGV4IGluc3RhbmNlb2YgTnVtYmVyKVxuXHRcdFx0cHJpbnQgXCJFUlJPUiAtIFBhaXI6b2ZmUmFuZ2VDaGFuZ2UoaW5kZXgpLCBpbmRleCBtdXN0IGJlIGEgTnVtYmVyXCJcblx0XHRcdHJldHVyblxuXG5cdFx0QF9yYW5nZUxpc3RlbmVyc1tpbmRleF0gPSBudWxsXG5cblxuXHQjIFJldHVybnMgaW5kZXhcblx0b25Db250YWN0Q2hhbmdlOiAoc3RhcnRGbixlbmRGbj0tPikgLT5cdFx0XG5cdFx0Y291bnQgPSAoQF9jb2xsaXNpb25MaXN0ZW5lcnMucHVzaCBcblx0XHRcdGNvbnRhY3RTdGFydDpzdGFydEZuXG5cdFx0XHRjb250YWN0RW5kOmVuZEZuXG5cdFx0XHRjb250YWN0OmZhbHNlKSAtIDFcdFxuXG5cdFx0cmV0dXJuIGNvdW50XG5cblxuXHRvZmZDb250YWN0Q2hhbmdlOiAoaW5kZXgpIC0+XG5cdFx0aWYgIShpbmRleCBpbnN0YW5jZW9mIE51bWJlcilcblx0XHRcdHByaW50IFwiRVJST1IgLSBQYWlyOm9mZkNvbnRhY3RDaGFuZ2UoaW5kZXgpLCBpbmRleCBtdXN0IGJlIGEgTnVtYmVyXCJcblx0XHRcdHJldHVyblxuXG5cdFx0QF9jb2xsaXNpb25MaXN0ZW5lcnNbaW5kZXhdID0gbnVsbCBcdFxuXG5cdCNcdFxuXHQjXHRFdmVudCBoYW5kbGluZyBjb252ZW5pZW5jZSBmdW5jdGlvbnNcblx0I1xuXG5cdG9uRHJhZ1N0YXJ0OiAoZm4pLT5cblx0XHRAb24gXCJkcmFnU3RhcnRcIiwgZm5cblxuXHRvbkRyYWdFbnRlcjogKGZuKS0+XG5cdFx0QG9uIFwiZHJhZ0VudGVyXCIsIGZuXG5cblx0b25EcmFnT3ZlcjogKGZuKS0+XG5cdFx0QG9uIFwiZHJhZ092ZXJcIiwgZm5cblxuXHRvbkRyYWdMZWF2ZTogKGZuKS0+XHRcdFxuXHRcdEBvbiBcImRyYWdPdXRcIiwgZm5cblx0XHRcblx0b25EcmFnT3V0OiAoZm4pLT5cblx0XHRAb24gXCJkcmFnT3V0XCIsIGZuXG5cblx0b25JbnZhbGlkRHJvcDogKGZuKS0+XG5cdFx0QG9uIFwiaW52YWxpZERyb3BcIiwgZm5cblxuXHRvbkRyb3A6IChmbiktPlxuXHRcdEBvbiBcImRyb3BcIiwgZm5cblxuXHRvbkNvbnRhY3REcm9wOiAoZm4pLT5cblx0XHRAb24gXCJjb250YWN0RHJvcFwiLCBmblxuXG5cdG9uSW52YWxpZENvbnRhY3REcm9wOiAoZm4pLT5cblx0XHRAb24gXCJpbnZhbGlkQ29udGFjdERyb3BcIiwgZm5cbiIsIihmdW5jdGlvbiBlKHQsbixyKXtmdW5jdGlvbiBzKG8sdSl7aWYoIW5bb10pe2lmKCF0W29dKXt2YXIgYT10eXBlb2YgcmVxdWlyZT09XCJmdW5jdGlvblwiJiZyZXF1aXJlO2lmKCF1JiZhKXJldHVybiBhKG8sITApO2lmKGkpcmV0dXJuIGkobywhMCk7dmFyIGY9bmV3IEVycm9yKFwiQ2Fubm90IGZpbmQgbW9kdWxlICdcIitvK1wiJ1wiKTt0aHJvdyBmLmNvZGU9XCJNT0RVTEVfTk9UX0ZPVU5EXCIsZn12YXIgbD1uW29dPXtleHBvcnRzOnt9fTt0W29dWzBdLmNhbGwobC5leHBvcnRzLGZ1bmN0aW9uKGUpe3ZhciBuPXRbb11bMV1bZV07cmV0dXJuIHMobj9uOmUpfSxsLGwuZXhwb3J0cyxlLHQsbixyKX1yZXR1cm4gbltvXS5leHBvcnRzfXZhciBpPXR5cGVvZiByZXF1aXJlPT1cImZ1bmN0aW9uXCImJnJlcXVpcmU7Zm9yKHZhciBvPTA7bzxyLmxlbmd0aDtvKyspcyhyW29dKTtyZXR1cm4gc30pIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiJBQ0FBOztBREFBOzs7Ozs7OztBQUFBLElBQUE7Ozs7QUFVTSxPQUFPLENBQUM7OztFQUliLElBQUMsQ0FBQSxZQUFELEdBQWM7O0VBRUQsY0FBQyxRQUFELEVBQVksT0FBWjtJQUFDLElBQUMsQ0FBQSxXQUFEO0lBQVcsSUFBQyxDQUFBLFVBQUQ7O0lBR3hCLElBQUcsQ0FBQyxDQUFDLElBQUMsQ0FBQSxRQUFELFlBQXFCLE1BQU0sQ0FBQyxLQUE3QixDQUFKO01BQ0MsS0FBQSxDQUFNLHdFQUFOO0FBQ0EsYUFGRDs7SUFJQSxJQUFHLENBQUMsQ0FBQyxJQUFDLENBQUEsT0FBRCxZQUFvQixNQUFNLENBQUMsS0FBNUIsQ0FBSjtNQUNDLEtBQUEsQ0FBTSx5RUFBTjtBQUNBLGFBRkQ7O0lBSUEsSUFBRyxJQUFDLENBQUEsUUFBUSxDQUFDLE1BQVYsS0FBb0IsSUFBQyxDQUFBLE9BQU8sQ0FBQyxNQUFoQztNQUNDLEtBQUEsQ0FBTSw4RkFBTjtBQUNBLGFBRkQ7O0lBS0EsSUFBQyxDQUFBLG1CQUFELEdBQXlCO0lBQ3pCLElBQUMsQ0FBQSw4QkFBRCxHQUFrQyxJQUFDLENBQUEsT0FBTyxDQUFDO0lBQzNDLElBQUMsQ0FBQSxZQUFELEdBQW1CO0lBQ25C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
