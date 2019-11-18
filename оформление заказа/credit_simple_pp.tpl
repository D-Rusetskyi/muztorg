<form id="privatbank_paymentparts_pp_checkout" style=" display: none;">
    <!--<span class="form-element" id="paymentsCount2cart"></span>, на-->
	<div id="mono_panel" class="panel panel-default" style="min-width: 415px;">
		<div class="panel-body">
			<div class="row">

				<div class="col-md-4" style="text-align: center;">
					<div class="row" style="text-align: center; padding-top: 25px;">
						<div class="form-group">
                            <select id="termInput2" name="partsCount_pp"  class="form-control">
                            <?php for($i=1;$i<=$partsCounts;$i++){ ?>
                            <option value="<?php echo $i; ?>"><?php echo $i; ?></option>
                            <?php } ?>
                            <input type="hidden" pattern="\d*" id="priceInput2" value="<?php echo $total; ?>">
						</div>
					</div>
				</div>  

				<div class="col-md-4" style="text-align: center;">
					<div class="row">
						<div class="col-md-12" style="text-align: center;">
							<div class="row" style="padding-top: 25px;">
							<?php // echo $text_mounth; ?>
								<span class="privat-price">
									<span id="ppResultValue">0</span><br>
									<!--<span class="result-additional-data-phys"></span>-->
								</span>
								<span>грн/мсц</span>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
</form>


<div style="margin: 5px 0;display:none;">
	<div id="termSlider2">
        <div id="termProgressBar" class="progress progress-striped">
            <div id="termProgress2" class="progress-bar progress-bar-success" role="progressbar" style="width: 0;"></div>
        </div>
    </div>
</div>
<script src="catalog/view/javascript/jquery/pp_calculator/calculator.js" type="text/javascript"></script>
<div id="activatescript"></div>
<script>
var curLang="<?php echo $language; ?>"
var constants = {
    'priceMax': 100000,
	'priceInitial': <?php echo $total; ?>,
	'priceInitial2': <?php echo $total; ?>,
    'termMax': <?php echo $partsCounts; ?>,
	'termMax2': <?php echo $partsCounts; ?>,
    'termMin': <?php echo ($partsCountSel ? $partsCountSel : '1'); ?>,
	'termMin2': <?php echo ($partsCountSel ? $partsCountSel : '1'); ?>,
    'termStep': 1,
	'termStep2': 1
};		
$('#activatescript').trigger('click');
<?php if ($partsCountSel) { ?>
$('#termInput2').val(<?php echo $partsCountSel; ?>).trigger('change');
<?php } ?>

$(document).ready(function () {

	if ( $('#privatbank_paymentparts_pp').is(':checked') ){
		$('#privatbank_paymentparts_pp_checkout').slideDown();
	}

	if ( $("input[name='payment_method']:checked").val() == 'privatbank_paymentparts_ii' ){
		$('#privatbank_paymentparts_pp_checkout').slideDown();
	}


});
</script>