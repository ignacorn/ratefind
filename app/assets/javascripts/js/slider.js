function Toggle(from, to) {
    if (from != to) {
        Hide(from);
        Show(to);
    }
}

function Show(i) {
    var slide = $(".slide").eq(i);
    var elem1 = slide.find(".el-1");
    var elem2 = slide.find(".el-2");
    var elem3 = slide.find(".el-3");

    slide.animate({
        opacity: "show"
    }, 1000);
    setTimeout(function() {
        elem1.animate({
            opacity: "show"
        }, 1000);
    }, 500);

    setTimeout(function() {
        elem2.animate({
            opacity: "show"
        }, 1000);
    }, 1000);

    setTimeout(function() {
        elem3.animate({
            opacity: "show"
        }, 1000);
    }, 1500);
}

function Hide(i) {
    var slide = $(".slide").eq(i);
    var elem1 = slide.find(".el-1");
    var elem2 = slide.find(".el-2");
    var elem3 = slide.find(".el-3");

    slide.animate({
        opacity: "hide"
    }, 1000);
    elem1.animate({
        opacity: "hide"
    }, 1000);
    elem2.animate({
        opacity: "hide"
    }, 1000);
    elem3.animate({
        opacity: "hide"
    }, 1000);
}

var controls = $("[name = slide_control]");
var timer;
var CurrentSlide = $("input:checked").index("[name = slide_control]");
Show(CurrentSlide);

controls.click(function() {
    clearInterval(timer);
    Toggle(CurrentSlide, $(this).index("[name = slide_control]"));
    CurrentSlide = $(this).index("[name = slide_control]");
    timer = setInterval(function() {
        if (CurrentSlide + 1 == controls.length) {
            Toggle(CurrentSlide, 0);
            CurrentSlide = 0;
        } else {
            Toggle(CurrentSlide, CurrentSlide + 1);
            CurrentSlide += 1;
        }
        controls.eq(CurrentSlide).prop("checked", true);
    }, 20000)

});

/*Start timer when page loaded, with delay*/
//setTimeout(function() {
    timer = setInterval(function() {
        if (CurrentSlide + 1 == $(controls).length) {
            Toggle(CurrentSlide, 0);
            CurrentSlide = 0;
        } else {
            Toggle(CurrentSlide, CurrentSlide + 1);
            CurrentSlide += 1;
        }
        controls.eq(CurrentSlide).prop("checked", true);
    }, 20000);
//}, 5000)