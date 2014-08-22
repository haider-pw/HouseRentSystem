/**
 * Created by HaiderHassan on 8/22/14.
 */
/*----------- BEGIN toggleButtons CODE -------------------------*/
$.each($('.make-switch'), function () {
    $(this).bootstrapSwitch({
        onText: $(this).data('onText'),
        offText: $(this).data('offText'),
        onColor: $(this).data('onColor'),
        offColor: $(this).data('offColor'),
        size: $(this).data('size'),
        labelText: $(this).data('labelText')
    });
});
/*----------- END toggleButtons CODE -------------------------*/