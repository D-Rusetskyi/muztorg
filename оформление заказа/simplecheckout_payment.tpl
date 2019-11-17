<?php 
//foreach ($payment_methods as $payment_method) { 
//echo '<pre>'; 
//print_r($payment_method);
//echo $payment_method['title'];
//echo '</pre>';



//}

//print_r($code);
?>
<div class="simplecheckout-block" id="simplecheckout_payment" <?php echo $hide ? 'data-hide="true"' : '' ?> <?php echo $display_error && $has_error ? 'data-error="true"' : '' ?>>
    <?php if ($display_header) { ?>
        <div class="checkout-heading panel-heading"><?php echo $text_checkout_payment_method ?></div>
    <?php } ?>
    <div class="alert alert-danger simplecheckout-warning-block" <?php echo $display_error && $has_error_payment ? '' : 'style="display:none"' ?>><?php echo $error_payment ?></div>
    <div class="simplecheckout-block-content">
        <?php if (!empty($payment_methods)) { ?>
            <?php if ($display_type == 2 ) { ?>
                <?php $current_method = false; ?>
                <select data-onchange="reloadAll" name="payment_method">
                    <?php foreach ($payment_methods as $payment_method) { ?>
                        <option value="<?php echo $payment_method['code']; ?>" <?php echo !empty($payment_method['dummy']) ? 'disabled="disabled"' : '' ?> <?php echo !empty($payment_method['dummy']) ? 'data-dummy="true"' : '' ?> <?php if ($payment_method['code'] == $code) { ?>selected="selected"<?php } ?>><?php echo $payment_method['title']; ?></option>
                        <?php if ($payment_method['code'] == $code) { $current_method = $payment_method; } ?>
                    <?php } ?>
                </select>
                <?php if ($current_method) { ?>
                    <?php if (!empty($current_method['description'])) { ?>
                        <div class="simplecheckout-methods-description"><?php echo $current_method['description']; ?></div>
                    <?php } ?>
                    <?php if (!empty($rows)) { ?>
                        <?php foreach ($rows as $row) { ?>
                          <?php echo $row ?>
                        <?php } ?>
                    <?php } ?>
                <?php } ?>
            <?php } else { 
				$payment_i = 0;
			?>
            <style>
                    #simplecheckout_payment .simplecheckout-block-content label{
                        flex-basis: 0%;
                    }

                    .text-way-payment, .text-bank-payment{
                        width: 100%;
                        text-align: center;
                        font-size: 20px;
                        margin: 15px 0;
                        color: #ff6c08;
                        font-weight: 500;
                    }
                    .mono_block{
                        width: 100%;
                    }


                    #mono_panel{
                        border: none;
                        width: 200px;
                    }
                    #mono_panel .privat_price_mono{
                        display: block;
                        background: white;
                    }

                    #mono_panel .form-group{
                        max-width: 100px;
                        margin: 0 auto;
                    }
                    .panel select {
                        width: 100px;
                        margin: 0 auto;
                    }
                    .privat-price{
                        font-size: 18px;
                        font-weight: bold;
                    }
                    #privatbank_paymentparts_ii_checkout .form-group{
                       /* max-width: 100%; */
                    }
            </style>


                <?php foreach ($payment_methods as $payment_method) {?> 
                    
				<?php	if ($payment_i++ == 4) {?>
                         
                        <div class='text-way-payment'></div>

						<h2 class="payment-credit-title">Кредитные программы</h2>

					<?php } ?>

                    <!--<div class="radio">-->
						<input 
                            type="radio"
                            data-onchange="reloadAll"
                            name="payment_method"
                            value="<?php echo $payment_method['code']; ?>" 
                            count="<?php echo $payment_i; ?>"
                            <?php echo !empty($payment_method['dummy']) ? 'disabled="disabled"' : '' ?>
                            <?php echo !empty($payment_method['dummy']) ? 'data-dummy="true"' : '' ?>
                            id="<?php echo $payment_method['code']; ?>" <?php if ($payment_method['code'] == $code) { ?>checked="checked"<?php } ?> 
                         />
						<label for="<?php echo $payment_method['code']; ?>">                            
                            <?php 
                            if($payment_method['code'] != 'monobank'){
                                 echo  $payment_method['title'];
                                  }else{
                                      $monoHtml = '<div class="mono_block">
                                       '. $payment_method['title'] .'
                                       </div>';
                                   } 
                                   ?>
                            <?php if (isset($payment_method['terms'])) { ?>
                                <?php echo $payment_method['terms']; ?>
                            <?php } ?>
                        </label>
                    <!--</div>-->
                    <?php if (!empty($payment_method['description']) && (!$display_for_selected || ($display_for_selected && $payment_method['code'] == $code))) { ?>
                        <div class="form-group">
                            <label for="<?php echo $payment_method['code']; ?>"><?php echo $payment_method['description']; ?></label>
                        </div>
                    <?php } ?>
                    <?php if ($payment_method['code'] == $code && !empty($rows)) { ?>
                        <?php foreach ($rows as $row) { ?>
                          <?php echo $row ?>
                        <?php } ?>
                    <?php } ?>
                <?php } ?>
                <div class="text-bank-payment"></div>
                <?php echo $monoHtml; ?>
            <?php } ?>
            <input type="hidden" name="payment_method_current" value="<?php echo $code ?>" />
            <input type="hidden" name="payment_method_checked" value="<?php echo $checked_code ?>" />
        <?php } ?>
        <?php if (empty($payment_methods) && $address_empty && $display_address_empty) { ?>
            <div class="simplecheckout-warning-text"><?php echo $text_payment_address; ?></div>
        <?php } ?>
        <?php if (empty($payment_methods) && !$address_empty) { ?>
            <div class="simplecheckout-warning-text"><?php echo $error_no_payment; ?></div>
        <?php } ?>
    </div>
</div>
<style>
.payment-credit-title {
    flex-basis: 100%;
    flex-grow: 0;
    margin: 10px;
    text-align: left;
}
</style>

<script>

    $('input[name="payment_method"]').on('click',  function (e) {
      let txt = $(this).val();
        if($(this).attr("count") < 5 ){
            setTimeout( () => {$('.text-way-payment').text(txt)}, 650)
        }else{
            setTimeout( () => {$('.text-bank-payment').text(txt)}, 650)
        }

        console.dir($('#mono_panel')[0].innerHTML);
    });
</script>
