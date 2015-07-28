(function(document) {
    var c = document.getElementsByClassName("signature-canvas")[0];
    var ctx = c.getContext("2d");

    ctx.moveTo(0, 0);
    ctx.lineTo(200, 100);
    ctx.stroke();
})(document)
