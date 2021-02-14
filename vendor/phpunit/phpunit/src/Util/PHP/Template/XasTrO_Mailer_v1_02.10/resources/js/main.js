function bs_input_file() {
    $(".input-file").before(
        function() {
            if ( ! $(this).prev().hasClass('input-ghost') ) {
                var element = $("<input type='file' class='input-ghost' name='files[]' multiple style='visibility:hidden; height:0'>");
                element.attr("name",$(this).attr("name"));
                element.change(function(){
                    element.next(element).find('input').val((element.val()).split('\\').pop());
                });
                $(this).find("button.btn-choose").click(function(){
                    element.click();
                });
                $(this).find("button.btn-reset").click(function(){
                    element.val(null);
                    $(this).parents(".input-file").find('input').val('');
                });
                $(this).find('input').css("cursor","pointer");
                $(this).find('input').mousedown(function() {
                    $(this).parents('.input-file').prev().click();
                    return false;
                });
                return element;
            }
        }
    );
}
$(function() {
    bs_input_file();

    $('input#smtp_on').change(function() {
        if($(this).is(':checked')) {
            $("#smtp_host").attr('required', 'required');
            $("#smtp_username").attr('required', 'required');
            $("#smtp_password").attr('required', 'required');
        } else {
            $("#smtp_host").removeAttr('required');
            $("#smtp_username").removeAttr('required');
            $("#smtp_password").removeAttr('required');
        }
    });
});
