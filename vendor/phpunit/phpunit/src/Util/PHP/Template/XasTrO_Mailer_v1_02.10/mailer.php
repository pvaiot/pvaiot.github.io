<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require 'lib/src/Exception.php';
require 'lib/src/PHPMailer.php';
require 'lib/src/SMTP.php';

set_time_limit(10800); //max execution time - 3 hours

function generateRandomString($characters, $length = 10) {
    $charactersLength = strlen($characters);
    $randomString = '';
    for ($i = 0; $i < $length; $i++) {
        $randomString .= $characters[rand(0, $charactersLength - 1)];
    }
    return $randomString;
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $post = (object) $_POST;
    
    //separate recipients
    $recipients = explode("\n", str_replace("\r", "", $post->letter_recipients));
    
    foreach ($recipients as $recipient) {
        $recipient = trim($recipient);
    
        //create mailing obj
        $mail = new PHPMailer(true);
        
        try {
            //Encoding
            if ($post->encode == 'encodeIso') {
                $mail->CharSet = 'iso-8859-1';
            } elseif ($post->encode == 'encodeUtd8') {
                $mail->CharSet = 'UTF-8';
            }
            
            $mail->Encoding = 'base64'; //TODO:TEST
    
            //Attachments
            if (isset($_FILES['files']) && isset($_FILES['files']['name']) && !empty($_FILES['files']['name'][0])) {
                foreach ($_FILES['files']['name'] as $i => $name) {
                    $mail->AddAttachment($_FILES['files']['tmp_name'][$i], $_FILES['files']['name'][$i]);
                }
            }
    
            //Templates
            $string = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
            $letters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
            $number = '0123456789';
            $post->letter_message = str_replace("#RECIPIENT#", $recipient, $post->letter_message);
            $post->letter_message = str_replace("#FROM#", $post->from_email, $post->letter_message);
            $post->letter_message = str_replace("#DATE#", date('d/m/Y'), $post->letter_message);
            $post->letter_message = str_replace("#TIME#", date('g:i A'), $post->letter_message);
            $post->letter_message = str_replace("#RANDOMLETTERS#", generateRandomString($letters, 8), $post->letter_message);
            $post->letter_message = str_replace("#RANDOMNUMBER#", generateRandomString($number, 8), $post->letter_message);
            $post->letter_message = str_replace("#RANDOMSTRING#", generateRandomString($string, 8), $post->letter_message);
            $post->letter_message = str_replace("#RANDOMMD5#", md5(generateRandomString($string)), $post->letter_message);
            
            $post->letter_subject = str_replace("#RECIPIENT#", $recipient, $post->letter_subject);
            $post->letter_subject = str_replace("#FROM#", $post->from_email, $post->letter_subject);
            $post->letter_subject = str_replace("#DATE#", date('d/m/Y'), $post->letter_subject);
            $post->letter_subject = str_replace("#TIME#", date('g:i A'), $post->letter_subject);
            $post->letter_subject = str_replace("#RANDOMLETTERS#", generateRandomString($letters, 8), $post->letter_subject);
            $post->letter_subject = str_replace("#RANDOMNUMBER#", generateRandomString($number, 8), $post->letter_subject);
            $post->letter_subject = str_replace("#RANDOMSTRING#", generateRandomString($string, 8), $post->letter_subject);
            $post->letter_subject = str_replace("#RANDOMMD5#", md5(generateRandomString($string)), $post->letter_subject);
            
            $post->from_name = str_replace("#RECIPIENT#", $recipient, $post->from_name);
            $post->from_name = str_replace("#FROM#", $post->from_email, $post->from_name);
            $post->from_name = str_replace("#DATE#", date('d/m/Y'), $post->from_name);
            $post->from_name = str_replace("#TIME#", date('g:i A'), $post->from_name);
            $post->from_name = str_replace("#RANDOMLETTERS#", generateRandomString($letters, 8), $post->from_name);
            $post->from_name = str_replace("#RANDOMNUMBER#", generateRandomString($number, 8), $post->from_name);
            $post->from_name = str_replace("#RANDOMSTRING#", generateRandomString($string, 8), $post->from_name);
            $post->from_name = str_replace("#RANDOMMD5#", md5(generateRandomString($string)), $post->from_name);
            
            $post->from_email = str_replace("#RECIPIENT#", $recipient, $post->from_email);
            $post->from_email = str_replace("#FROM#", $post->from_email, $post->from_email);
            $post->from_email = str_replace("#DATE#", date('d/m/Y'), $post->from_email);
            $post->from_email = str_replace("#TIME#", date('g:i A'), $post->from_email);
            $post->from_email = str_replace("#RANDOMLETTERS#", generateRandomString($letters, 8), $post->from_email);
            $post->from_email = str_replace("#RANDOMNUMBER#", generateRandomString($number, 8), $post->from_email);
            $post->from_email = str_replace("#RANDOMSTRING#", generateRandomString($string, 8), $post->from_email);
            $post->from_email = str_replace("#RANDOMMD5#", md5(generateRandomString($string)), $post->from_email);
            
            //set subject
            $mail->Subject = $post->letter_subject;
    
            //set message
            $mail->Body = $post->letter_message;
            if ($post->type == 'typeHtml') {
                $mail->isHTML(true);
            }
    
            $mail->AltBody = $post->letter_message;
            //message type
            if ($post->type == 'typeHtml') {
                $mail->isHTML(true);
            }
    
            //add recipient
            $mail->addAddress($recipient);
    
            //add reply-to
            if (!empty($post->letter_reply)) {
                $mail->addReplyTo($post->letter_reply);
            }
    
            //use smtp
            //smtp auth
            //smtp host
            //smtp port
            //smtp name
            //smtp pwd
            //smtp secure
            
            if ($post->smtp_on) {
                $mail->SMTPDebug = 2;
                $mail->isSMTP();
                $mail->Host = $post->smtp_host;
                $mail->Port = $post->smtp_port ? $post->smtp_port : 587;
        
                $mail->SMTPAuth = true;
                $mail->Username = $post->smtp_username;
                $mail->Password = $post->smtp_password;
        
                if ($post->smtp_secure == 'tls') {
                    $mail->SMTPSecure = 'tls';
                } elseif ($post->smtp_secure == 'ssl') {
                    $mail->SMTPSecure = 'ssl';
                }
            }
    
            //set from, name
            $mail->setFrom($post->from_email, $post->from_name);
    
            $mail->send();
            $mail->clearAllRecipients();
            print_r($recipient . ' - Successful!<br/>');
        } catch (Exception $e) {
            echo 'Message could not be sent. Error: ', $mail->ErrorInfo;
        }
    }
    
    print_r('<br/>DONE! You will be redirected to main page in 1 minute.');
    print_r('<br/>Total recipients count: ' . count($recipients));
    
    $secondsWait = 60;
    echo '<meta http-equiv="refresh" content="'.$secondsWait.'">';
    
    die();
}
?>


<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <title>XasTrO Mailer</title>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet">
    <!--[if lt IE 9]>
        <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
</head>

<div id="wrap">
    <div class="navbar navbar-default">
        <div class="container" style="width:90%;">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">XasTrO Mailer</a>
            </div>
        </div>
    </div>
    
    <div class="container" style="width:90%;">
        <form method="POST" enctype="multipart/form-data">
        <div class="page-header" style="margin-top: 0px;">
            <h3>Mailing setup</h3>
            
            <button type="submit" class="btn btn-primary btn-md" role="button" style="float:right;position:relative;top:-40px;">SEND FOR ALL RECIPIENTS</button>
        </div>
    
        
            <div class="col-md-9">
                <div class="col-md-6">
                    <label>From</label>
                    <div class="input-group">
                        <span class="input-group-addon">@</span>
                        <input name="from_email" type="email" class="form-control" placeholder="Please type sender e-mail" required>
                    </div>
                </div>
                <div class="col-md-6">
                    <label>&nbsp;</label>
                    <div class="input-group">
                        <span class="input-group-addon">Name</span>
                        <input name="from_name" type="text" class="form-control" placeholder="Please type sender name" required>
                    </div>
                </div>
                
                <div class="clearfix"></div>
                
                <br/><br/>
                <div class="col-md-12">
                    <label>Attachments</label>
    
                    <div class="form-group">
                        <div class="input-group input-file">
                            <span class="input-group-btn">
                                <button class="btn btn-default btn-choose" type="button">Choose</button>
                            </span>
                            <input type="text" class="form-control" placeholder='Choose a file...' />
                            <span class="input-group-btn">
                             <button class="btn btn-warning btn-reset" type="button">Reset</button>
                        </span>
                        </div>
                    </div>
                </div>
        
                <div class="clearfix"></div>
                
                <br/>
                <div class="col-md-6">
                    <label>Subject letter</label>
                    <div class="input-group">
                        <span class="input-group-addon">Subject</span>
                        <input name="letter_subject" type="text" class="form-control" placeholder="Please type" required>
                    </div>
                </div>
                <div class="col-md-6">
                    <label>Reply to (email)</label>
                    <div class="input-group">
                        <span class="input-group-addon">@</span>
                        <input name="letter_reply" type="email" class="form-control" placeholder="Please type reply-to e-mail">
                    </div>
                </div>
        
                <div class="clearfix"></div>
                
                <br/>
                <div class="col-md-6">
                    <label>Message</label>
                    <textarea name="letter_message" class="form-control" rows="10" required></textarea>
                </div>
                <div class="col-md-6">
                    <label>Recipients (each email on new line)</label>
                    <textarea name="letter_recipients" class="form-control" rows="10" required></textarea>
                </div>
                
                <div class="clearfix"></div>
        
                <br/><br/>
                <div class="col-md-6">
                    <label>Message type</label>
                    <div class="radio">
                        <label>
                            <input type="radio" name="type" id="typePlain" value="typePlain" checked>
                            Plain text
                        </label>
                    </div>
                    <div class="radio">
                        <label>
                            <input type="radio" name="type" id="typeHtml" value="typeHtml">
                            HTML
                        </label>
                    </div>
                </div>
                <div class="col-md-6">
                    <label>Encoding</label>
                    <div class="radio">
                        <label>
                            <input type="radio" name="encode" id="encodeUtf8" value="encodeUtf8" checked>
                            UTF-8 Encode
                        </label>
                    </div>
                    <div class="radio">
                        <label>
                            <input type="radio" name="encode" id="encodeIso" value="encodeIso">
                            ISO Encode
                        </label>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
    
                <div class="col-md-12">
                    <label>&nbsp;</label>
                    <div class="panel panel-default">
                        <div class="panel-heading">SMTP</div>
                        <div class="panel-body">
                            <label>Settings</label>
                            <div class="col-md-12">
                                <div class="checkbox">
                                    <label><input id="smtp_on" name="smtp_on" type="checkbox">Use custom SMTP</label>
                                </div>
                            </div>
    
                            <div class="clearfix"></div>
    
                            <label>Host</label>
                            <div class="col-md-12">
                                <div class="input-group">
                                    <span class="input-group-addon">HOST</span>
                                    <input id="smtp_host" name="smtp_host" type="text" class="form-control" placeholder="Please type">
                                </div>
                            </div>
    
                            <br/>
                            <div class="clearfix"></div>
                            <br/>
                            
                            <div class="col-md-12">
                                <div class="input-group">
                                    <span class="input-group-addon">PORT</span>
                                    <input id="smtp_port" name="smtp_port" type="number" class="form-control" placeholder="Please type" value="587">
                                </div>
                            </div>
    
                            <br/>
                            <div class="clearfix"></div>
                            <br/>
    
                            <div class="col-md-12">
                                <div class="input-group">
                                    <span class="input-group-addon">NAME</span>
                                    <input id="smtp_username" name="smtp_username" type="text" class="form-control" placeholder="Please type">
                                </div>
                            </div>
    
                            <br/>
                            <div class="clearfix"></div>
                            <br/>
    
                            <div class="col-md-12">
                                <div class="input-group">
                                    <span class="input-group-addon">PSWD</span>
                                    <input id="smtp_password" name="smtp_password" type="password" class="form-control" placeholder="Please type">
                                </div>
                            </div>
    
                            <br/>
                            <div class="clearfix"></div>
                            <br/>
    
                            <label>SMTP Secure</label>
                            <div class="col-md-12">
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="smtp_secure" value="tls">
                                        TLS
                                    </label>
                                </div>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="smtp_secure" value="ssl">
                                        SSL
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="clearfix"></div>
                
                <div class="col-md-12">
                    <label>&nbsp;</label>
                    <div class="panel panel-default">
                        <div class="panel-heading">Instructions</div>
                        <div class="panel-body">
                            <h4>Server Information</h4>
                            <p>ServerIP : <?= $_SERVER['SERVER_ADDR']; ?></p>
                            
                            <h4>HELP</h4>
                            <p>#RECIPIENT# : recipient@test.com</p>
                            <p>#FROM# : from-email@test.com</p>
                            <p>#DATE# : 01/01/2019</p>
                            <p>#TIME# : 11:40 PM</p>
                            <p>#RANDOMSTRING# : (0-9, a-z)</p>
                            <p>#RANDOMLETTERS# : (a-z)</p>
                            <p>#RANDOMNUMBER# : (0-9)</p>
                            <p>#RANDOMMD5# : Random MD5</p>
                            
                            <h4>Example</h4>
                            <p>Your e-mail: #RECIPIENT#</p>
                            <p>Current time: #TIME#</p>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>

<div id="footer">
    <div class="container">
        <p class="text-muted credit">Developed by <a href="www.linkedin.com/in/nickkolesnikov" target="_blank">Nick Kolesnikov</a></p>
    </div>
</div>

<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript" src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/js/main.js"></script>