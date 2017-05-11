var b, boxes, clickHandle, l, n, _i;

clickHandle = function(event, layer) {
  var box, _i, _len;
  for (_i = 0, _len = boxes.length; _i < _len; _i++) {
    box = boxes[_i];
    box.opacity = 0.5;
    box.nameLabel.opacity = 0.5;
  }
  this.opacity = 1;
  return this.nameLabel.opacity = 1;
};

boxes = [];

for (n = _i = 0; _i < 5; n = ++_i) {
  b = new Layer({
    height: 20,
    y: n * 22,
    opacity: 0.5,
    backgroundColor: "blue"
  });
  l = new Layer({
    height: 20,
    y: n * 22,
    x: 230,
    width: 10,
    backgroundColor: "red",
    opacity: 0.5
  });
  b.nameLabel = l;
  b.onMouseDown(clickHandle);
  boxes.push(b);
}
