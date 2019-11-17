<div id="addcredit-popup" class="white-popup mfp-with-anim">
    <?php if ($status_pp && $status_ii) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($status_pp || $status_ii) { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } else { ?>
    <?php $class = 'hidden'; ?>
    <?php } ?>
    <link href="catalog/view/javascript/jquery/pp_calculator/calculator.css" rel="stylesheet" type="text/css">
    <style>
        .option-input {
            -webkit-appearance: none;
            -moz-appearance: none;
            -ms-appearance: none;
            -o-appearance: none;
            appearance: none;
            position: relative;
            top: 5.33333px;
            right: 0;
            bottom: 0;
            left: 0;
            height: 20px;
            width: 20px;
            transition: all 0.15s ease-out 0s;
            background: #cbd1d8;
            border: none;
            color: #fff;
            cursor: pointer;
            display: inline-block;
            margin-right: 0.5rem;
            outline: none;
            position: relative;
            z-index: 1000;
        }

        .option-input:hover {
            background: #9faab7;
        }

        .option-input:checked {
            background: #5dba5d;
        }

        .option-input:checked::before {
            width: 19px;
            position: absolute;
            content: '✓';
            display: inline-block;
            font-size: 17px;
            text-align: center;
            line-height: 22px;
        }

        .option-input:checked::after {
            -webkit-animation: click-wave 0.65s;
            -moz-animation: click-wave 0.65s;
            animation: click-wave 0.65s;
            background: #40e0d0;
            content: '';
            display: block;
            position: relative;
            z-index: 100;
        }

        .option-input.radio {
            height: 20px;
            width: 20px;
            border-radius: 50%;
            position: relative;
            top: 7px;
            margin-right: 7px;
        }

        .option-input.radio::after {
            border-radius: 50%;
        }

        .private, .credit {
            display: none;
        }
        #ipTitle, #ppTitle {
            display: inline;
            font-size: 11px;
            color: #2f2f2f;
            margin-left: 6px;
        }
        .form-control {
            width: 70px;
        }
        .flexMY{
            display: flex;
            align-items: center;
            /*justify-content: space-between;*/
            flex-wrap: wrap;
            padding: 9px;
            border-bottom: 1px solid #e5e5e5;
        }
        .d-flex-around{
            display: flex;
            justify-content: space-between;
        }
        .blockText{
            font-size: 13px;
            font-weight: 700;
            color: #595959;
        }
        .costText{
            font-size: 16px;
            font-weight: 500;
            color: #9d9d9d;
        }
    </style>
    <div class="container" style="width:100%;">


<div class="flexMY">
        <div class="col-sm-4  blockText">Выберите банк</div>
        <div class="col-sm-8">
            <div class=" d-flex-around">
            <label>
                <input type="radio" class="option-input radio" name="selectBank" value="monobank" checked>
                <img src="/catalog/view/theme/modern/image/monobank_80x30_normal.png" width="70">
            </label>
            <label>
                <input type="radio" class="option-input radio" name="selectBank" value="private">
                <img src="/catalog/view/theme/modern/image/OCH_1.png" width="110">
            </label>
            </div>
        </div>
</div>
        <div class="flexMY">
        <div class="col-sm-4  blockText">Выберите условие</div>
        <div class="col-sm-8">
            <div class="private">
                <div class=" d-flex-around">
                <label <?php echo ($status_pp?'':'style="display:none"') ?>>
                    <input type="radio" class="option-input input-condition radio" name="select_condition" value="installments" checked>
                    <img class="centered" src="catalog/view/javascript/jquery/pp_calculator/img/pp_logo.png"
                         width="20"/><span id="ppTitle" class="text-center bold"></span>
                </label>
                <label <?php echo ($status_ii?'':'style="display:none"') ?>>
                    <input type="radio" class="option-input input-condition radio" name="select_condition" value="credit">
                    <img class="centered" src="catalog/view/javascript/jquery/pp_calculator/img/ip_logo.png"
                         width="20"/><span id="ipTitle" class="text-center bold"></span>
                </label>
                </div>
            </div>
            <div class="monobank">
                <label>
                    <input type="radio" class="option-input input-condition radio" name="select_condition_mono" value="installments_mono" checked>
                    <span id="ppTitle" class="text-center bold">«Оплата частями»</span>
                </label>
            </div>
        </div>
        </div>
        <div class="flexMY">
        <div class="col-sm-4  blockText ">Кол-во платежей</div>
        <div class="col-sm-8">
            <div class="monobank">
                    <select id="termInput2Mono" name="selectpp"  class="form-control">
                        <?php
                                        $number = [];
                                        $number[0] = 1;
                                        if(!empty($mono_qnt)){
                                             for ($i=1;$i<=$mono_qnt;$i++) { ?>
                        <option value="<?php echo $i; ?>"><?php echo $i; ?></option>
                        <?php }
                                        }else{
                                        $number = explode(',' , $monobank_payment_paymentquantity);
                                        foreach($number as $mono_count){ ?>
                        <option value="<?php echo $mono_count; ?>"><?php echo $mono_count; ?></option>
                        <?php }
                                        }?>
                    </select>
            </div>
            <div class="private">
                <div class="installments">
                    <form  id="ppResult" <?php echo ($status_pp?'':'style="display:none"') ?>>
                        <select id="termInput2" name="selectpp" class="form-control">
                            <?php for($i=1;$i<=$partsCountpp;$i++){ ?>
                            <option value="<?php echo $i; ?>"><?php echo $i; ?></option>
                            <?php } ?>
                        </select>
						<input type="text" class="form-control text-center numeric-input"
                                id="priceInput2" value="<?php echo round($total*$markuppp); ?>"  style="display: none;">
                    </form>
                </div>
                <div class="credit">
                    <form  id="ipResult" <?php echo ($status_ii?'':'style="display:none"') ?>>
                        <select id="termInput" name="selectii" class="form-control">
                            <?php for($i=1;$i<=$partsCountii;$i++){ ?>
                            <option value="<?php echo $i; ?>"><?php echo $i; ?></option>
                            <?php } ?>
                        </select>
                        <input type="text" class="form-control text-center numeric-input"
                                id="priceInput" value="<?php echo round($total*$markupii); ?>" style="display: none;">
                    </form>
                </div>
            </div>
        </div>
        </div>
        <div class="flexMY" style="border-bottom: none;">
        <div class="col-sm-4  blockText">Ежемесячный платеж</div>
        <div class="col-sm-8 costText">
            <div class="monobank">
                <input type="text" style="border: none;"
                       id="priceInput2Mono" value="<? echo $total; ?>">
            </div>
            <div class="private">
                <div class="installments " <?php echo ($status_pp?'':'style="display:none"') ?>>
                    <div class="" id="ppResultValue">0</div>
                </div>
                <div class="credit">
                    <div class="" id="ipResultValue">0</div>
                </div>

            </div>

        </div>
        </div>
        <div class="modal-footer-popap">
            <div class="col-md-12 text-right" style="margin: 10px;">
                <span class="costText"><span class="ppcost"></span>: <?php echo round($total*$markupii); ?> грн.</span>
                <div class="monobank">
                    <a href="/simplecheckout/">
                        <input id="monobank-type" type="submit" value="Продолжить" class="btn btn-lg btn-success">
                    </a>
                </div>
                <div class="private">
                    <div class="installments"  <?php echo ($status_pp?'':'style="display:none"') ?>>
                        <input id="privat_type-button" type="submit" value="<?php echo $button_continue; ?>" class="btn btnChast btn-lg btn-success"/>
                    </div>
                    <div class="credit">
                        <input id="privat_type-button2" type="submit" value="<?php echo $button_continue; ?>"
                                class="btn btnCredit btn-lg btn-success"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="private">
            <div class="pr_info text-center"><?php echo $credit_text; ?></div>
        </div>
    </div>
                    <script>

                $('.option-input').on('change', function () {
                    if ($("[name=selectBank]:checked").val() == 'monobank') {
                        $('.monobank').show();
                        $('.private').hide();

                    } else {
                        $('.monobank').hide();
                        $('.private').show();
                    }
                });

                $('.input-condition').on('change', function () {
                    if ($("[name=select_condition]:checked").val() == 'installments') {
                        $('.installments').show();
                        $('.credit').hide();
                    } else {
                        $('.installments').hide();
                        $('.credit').show();
                    }
                });

                $('#termInput2Mono').on("change", function () {
                    var val = $(this).val();
                    var price_full = '<? echo $total; ?>';
                    var price = price_full.replace('грн.', '');
                    var sum = Math.round(price / val);

                    $('#priceInput2Mono').val(sum + ' грн.');
                    $('#paymentsCount2Mono').text(parseInt(val) + 1);
                });

                $('#monobank-type').click(function () {
                    $.ajax({
                        url: 'index.php?route=checkout/cart/add',
                        type: 'post',
                        data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
                        dataType: 'json',
                        beforeSend: function () {
                            $('#monobank-type').attr('disabled', 'disabled');
                        },
                        success: function (json) {
                            if (json['success']) {
                                $('#cart-total').html(json['total']);
                            }
                        },
                        error: function (xhr, ajaxOptions, thrownError) {
                            console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                        }
                    });
                });

                (function (d, s, id) {
                    var js, fjs = d.getElementsByTagName(s)[0];
                    var loaded = false;
                    if (d.getElementById(id)) return;
                    js = d.createElement(s);
                    js.id = id;
                    js.src = "https://sfr.kiev.ua:9000/widget.min.js";
                    fjs.parentNode.insertBefore(js, fjs);
                    js.onload = s.onreadystatechange = function () {
                        if (!loaded && !this.readyState || this.readyState == 'complete') {
                            loaded = true;
                            MfsCreditCalcWidget.init({'selector' : '.MfsCreditCalcWidgetButton', 'rassrochkaEnabled' : true, 'partner' : 'muztorg.ua', 'banks' : ['alpha', 'otp', 'creditmarket', 'factoring']});
                        }
                    };
                }(document, 'script', 'calc-jswidget'))


            </script>
        <div id="activatescript"></div>
<script type="text/javascript" src="catalog/view/javascript/jquery/pp_calculator/calculator.js"></script>
<script>
var curLang="<?php echo $language; ?>"
var constants = {
    'priceMax': 100000,
	'priceInitial': <?php echo round($total*$markupii, 2); ?>,
	'priceInitial2': <?php echo round($total*$markuppp, 2); ?>,
    'termMax': <?php echo $partsCountii; ?>,
    'termMin': 1,
    'termStep': 1,
	'termMax2': <?php echo $partsCountpp; ?>,
    'termMin2': 1,
    'termStep2': 1
};		
$('#activatescript').trigger('click');
</script>

<script>
    $(".btnChast").click(function(){
		$.ajax({
			url: 'index.php?route=checkout/cart/add',
			type: 'post',
			data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
			dataType: 'json',
			beforeSend: function() {
				$('#privat_type-button').attr('disabled', true);
			},			
			success: function(json) {
				if (json['success']) {
					$('#cart-total').html(json['total']);
				}	
			},
			error: function(xhr, ajaxOptions, thrownError) {
				console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}	
		});	
	
        var error = false;
        partsCounArr = {partsCount: $('#termInput2').val()};        
        $.ajax({
            type: 'POST',
            url: 'index.php?route=extension/payment/privatbank_paymentparts_pp/setPrivatType',
            dataType: 'json',
            data: partsCounArr,
			success: function(json) {
				if (json['redirect']) {
					location = json['redirect'];
				}   
			},
			error: function(xhr, ajaxOptions, thrownError) {
				console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}		     
        });
        return false;    
    });
	
    $(".btnCredit").click(function(){
		$.ajax({
			url: 'index.php?route=checkout/cart/add',
			type: 'post',
			data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
			dataType: 'json',
			beforeSend: function() {
				$('#privat_type-button2').attr('disabled', true);
			},			
			success: function(json) {
				if (json['success']) {
					$('#cart-total').html(json['total']);
				}	
			},
			error: function(xhr, ajaxOptions, thrownError) {
				console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}	
		});	
		
        var error = false;
        partsCounArr = {partsCount: $('#termInput').val()};        
        $.ajax({
            type: 'POST',
            url: 'index.php?route=extension/payment/privatbank_paymentparts_ii/setPrivatType',
            dataType: 'json',
            data: partsCounArr,
			success: function(json) {
				if (json['redirect']) {
					location = json['redirect'];
				}   
			},
			error: function(xhr, ajaxOptions, thrownError) {
				console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}		     
        });
        return false;    
    });
</script>
    </div>