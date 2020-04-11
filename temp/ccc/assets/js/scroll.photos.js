window.imgscroll = {
    options: { target: null, img_list: null, img_max: 0, img_num: 0, step_max: 500, step_num: 0, img_obj: new Image(), s_scroll: 0, w_height: 0, l_height: 300, w_width: 640 }, onLoad: function () {
        if (this.options.img_num >= this.options.img_max) { $("#img_load").hide(); $("#control_block").show(); return; }
        this.options.img_obj.src = this.options.img_list[this.options.img_num].url; this.options.img_obj.onload = function () { imgscroll.endLoad(this.width); };
    }, endLoad: function (width) { width = this.options.w_width > width ? width + "px" : "99%"; this.options.target.append('<div style="text-align:center;color:#999;padding-bottom:10px;font-size:13px;"><img src="' + this.options.img_list[this.options.img_num].url + '" width="' + width + '"><br /><span>' + (this.options.img_num + 1) + '/' + this.options.img_max + '</span></div>'); this.options.img_num += 1; if (this.options.step_num < this.options.step_max) { this.options.step_num += 1; this.onLoad(); } else { this.options.step_num = 0; } }, beLoad: function (target, img_list, benum) { this.options.target = target; this.options.img_list = img_list; this.options.img_max = img_list.length; this.options.img_num = benum; this.options.l_height = $(window).height() * 2; this.options.w_width = $("body").width(); $(window).scroll(function () { if (window.citeDis) return; imgscroll.options.s_scroll = $(window).scrollTop(); imgscroll.options.w_height = $("body").height(); if ((imgscroll.options.w_height - imgscroll.options.s_scroll) < imgscroll.options.l_height) { if (imgscroll.options.step_num < 1) imgscroll.onLoad(); } }); this.onLoad(); }
};
function changeMeta(isScl) { var meta = document.getElementsByTagName('meta'); if (isScl) { meta[0].setAttribute('content', "width=device-width, initial-scale=1.0, maximum-scale=3.0, user-scalable=3.0;"); } else { meta[0].setAttribute('content', "width=device-width, initial-scale=1.0, user-scalable=no"); } }
function citeShow(isShow) { if (isShow) { $('#cite_vote').css('display', ''); $('body').css('background', '#fafafa'); $("#toolbar_bottom").hide(); changeMeta(0); window.citeDis = 1; window.imgListTop = $(window).scrollTop(); $('#img_list').css('display', 'none'); $('#img_load').css('display', 'none'); } else { $('#img_list').css('display', ''); $('body').css('background', '#444'); $("#toolbar_bottom").show(); $(window).scrollTop(window.imgListTop); $('#cite_vote').css('display', 'none'); changeMeta(1); setTimeout("window.citeDis = 0;", 500); if ($('#control_block').css('display') == 'none') $('#img_load').css('display', ''); } }
function toShare() { $("#mask_panel").fadeIn("slow").click(function () { $("#pop_grade").slideUp("fast", function () { $("#mask_panel").fadeOut("slow"); }); }); $("#pop_grade").slideDown("fast"); }
window.autoScroll = {
    wsTop: 0, wStep: 0, wNum: 0, wPx: 5, wUp: 0, setTime: null, autoSrl: function () {
        if (autoScroll.wUp < 1) { $(window).scrollTop(autoScroll.wsTop + autoScroll.wPx * autoScroll.wStep); } else { $(window).scrollTop(autoScroll.wsTop - autoScroll.wPx * autoScroll.wStep); }
        if (autoScroll.wStep < autoScroll.wNum) { autoScroll.wStep += 1; autoScroll.setTime = setTimeout(autoScroll.autoSrl, 5); } else { autoScroll.wStep = 0; autoScroll.setTime = null; }
    }, beAuto: function (up) {
        if (autoScroll.setTime == null) {
            if (up < 1) { autoScroll.wUp = 0; } else { autoScroll.wUp = 1; }
            this.autoSrl();
        }
    }
}
$(function () {
    var musY, winH, toolBar, toolBar_b;

    $("body").click(function (event) { toolBar = $("#toolbar"); toolBar_b = $("#toolbar_bottom"); musY = event.clientY; winH = $(window).height(); if (toolBar.attr("display") == 1) { if (musY > 40 && musY < (winH - 40)) { toolBar.attr("display", 0).fadeOut(); toolBar_b.fadeOut(); } } else { if (window.citeDis) return false; if (musY < (winH * 0.4)) { autoScroll.wNum = winH / autoScroll.wPx; autoScroll.wsTop = $(window).scrollTop(); if (autoScroll.wsTop > 0) autoScroll.beAuto(1); } else if (musY > (winH * 0.8)) { autoScroll.wNum = winH / autoScroll.wPx; autoScroll.wsTop = $(window).scrollTop(); autoScroll.beAuto(0); } else { toolBar.attr("display", 1).fadeIn(); toolBar_b.fadeIn(); } } });
});