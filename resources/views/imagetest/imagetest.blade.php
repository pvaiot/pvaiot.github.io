<!DOCTYPE HTML>

<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Bhawani Transport</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Free HTML5 Website Template by GetTemplates.co" />
    <meta name="keywords" content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
    <meta name="author" content="GetTemplates.co" />

    <!-- Facebook and Twitter integration -->
    <meta property="og:title" content=""/>
    <meta property="og:image" content=""/>
    <meta property="og:url" content=""/>
    <meta property="og:site_name" content=""/>
    <meta property="og:description" content=""/>
    <meta name="twitter:title" content="" />
    <meta name="twitter:image" content="" />
    <meta name="twitter:url" content="" />
    <meta name="twitter:card" content="" />

    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700" rel="stylesheet">


    <link rel="stylesheet" href="{{asset('croper/css/imgareaselect.css')}}">


</head>

<body>

<?php echo Form::open(array('route' => 'imgae_upload_test','files' => true, 'enctype' => 'multipart/form-data')); ?>
    Upload Image: <input type="file" name="image" id="image" />
    <input type="hidden" name="x1" value="" />
    <input type="hidden" name="y1" value="" />
    <input type="hidden" name="w" value="" />
    <input type="hidden" name="h" value="" /><br><br>
    Upload Image: <input type="file" name="image2" id="image2" />
    <input type="hidden" name="x2" value="" />
    <input type="hidden" name="y2" value="" />
    <input type="hidden" name="w2" value="" />
    <input type="hidden" name="h2" value="" /><br><br>
    <input type="submit" name="submit" value="Submit" />
</form>
    <p id="p1"><img id="previewimage" style="display:none;width: 100%;height: 100%;" /></p>

<p id="p2"><img id="previewimage2" style="display:none;"/></p>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="{{asset('croper/js/jquery.imgareaselect.min.js')}}"></script>
<script>
    jQuery(function($) {

        var p = $("#previewimage");
        $("body").on("change", "#image", function(){

            var imageReader = new FileReader();
            imageReader.readAsDataURL(document.getElementById("image").files[0]);

            imageReader.onload = function (oFREvent) {
                p.attr('src', oFREvent.target.result).fadeIn();
            };
        });

        $('#previewimage').imgAreaSelect({
            onSelectEnd: function (img, selection) {
                $('input[name="x1"]').val(selection.x1);
                $('input[name="y1"]').val(selection.y1);
                $('input[name="w"]').val(selection.width);
                $('input[name="h"]').val(selection.height);
            }
        });
    });
</script>
<script>
    jQuery(function($) {

        var p = $("#previewimage2");
        $("body").on("change", "#image2", function(){

            var imageReader = new FileReader();
            imageReader.readAsDataURL(document.getElementById("image2").files[0]);

            imageReader.onload = function (oFREvent) {
                p.attr('src', oFREvent.target.result).fadeIn();
            };
        });

        $('#previewimage2').imgAreaSelect({
            onSelectEnd: function (img, selection) {
                $('input[name="x2"]').val(selection.x1);
                $('input[name="y2"]').val(selection.y1);
                $('input[name="w2"]').val(selection.width);
                $('input[name="h2"]').val(selection.height);
            }
        });
    });
</script>
<!-- Waypoints -->
</body>
</html>

