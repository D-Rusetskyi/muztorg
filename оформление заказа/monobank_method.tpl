<span><?=$title;?></span>
<div id="mono_panel" class="panel panel-default" style="min-width: 415px; display: none;">
    <div class="panel-body">
        <div class="row">
            <div class="col-md-4"><img style="padding-top: 18px;" src="image/payment/mono-logo-check.png"></div>

            <div class="col-md-4" style="text-align: center;">
                <div class="row" style="text-align: center; padding-top: 25px;">

                    <div class="form-group">
                        <select id="parts_mono_select" name="parts_mono_select" class="selectpicker_mono form-control text-center">
                            <?if(!empty($mono_qty)){
                                 for ($i=1;$i<=$mono_qty;$i++) { ?>
                                    <option><?php echo $i; ?></option>
                                <?php }
                            }else{
                            if(isset($mono_parts) && is_array($mono_parts) && count($mono_parts) > 0) { ?>
                                <? foreach($mono_parts as $part_item) { ?>
                                    <option><?=$part_item;?></option>
                                <? }
                            }else{ ?>
                                <option selected>3</option>
                            <? }
                            }?>
                        </select>
                    </div>
                </div>
            </div>

            <div class="col-md-4" style="text-align: center;">
                <div class="row">
                    <div class="col-md-12" style="text-align: center;">
                        <div class="row" style="padding-top: 25px;">
                            <? echo $text_privat_price_mono_before; ?><span class="privat_price_mono"><? echo $text_privat_price_mono_after; ?></span>
                            <div><? echo $text_per_month; ?></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div style="font-size: 10px;color: #9E9E9E; text-align: center;">
            <? echo $text_overpayment; ?><? echo $currency; ?>
        </div>

    </div>
</div>

<script>
    $(document).ready(function () {
        recalc_mono_credit();

        if ( $('#monobank').is(':checked') ){
            $('#mono_panel').slideDown();
        }

        if ( $("input[name='payment_method']:checked").val() == 'monobank' ){
            $('#mono_panel').slideDown();
        }

        $( "#collapse-payment-method" ).on('change',"input[name='payment_method']",function(){
            if ( $( this ).val() == 'monobank' ){
                $('#mono_panel').slideDown();
            }else{
                $('#mono_panel').slideUp();
            }
            recalc_mono_credit();
        })

    });
    function recalc_mono_credit(){

        var count_pay = get_cookie('count_pay_mono');

        if ( !count_pay){
            count_pay = <? if (isset($mono_parts[0])) echo $mono_parts[0]; else echo '3'; ?>;
        }

        var total_credit_privat = '<?=$total;?>';
        total_credit_privat = total_credit_privat.replace(/\s+/g, '');
        var currency = '<?=$currency;?>';
        var price = parseInt( total_credit_privat.match(/\d+/g) );

        $('.privat_price_mono').text( (price/(count_pay*1)).toFixed(2) + ' ' + currency );

        /*$('.selectpicker_mono').selectpicker({
            width: 'fit'
        });*/
        $('.selectpicker_mono').on('change', function (e) {
            var val = $('.selectpicker_mono').val();

            set_cookie('count_pay_mono', val);
            $('.count_pay_mono').text( (val*1+1) );

            //var price = parseInt( total_credit_privat.match(/\d+/g) );

            $('.privat_price_mono').text( (price/(val*1)).toFixed(2) + ' ' + currency );

        });

        if (count_pay > 0){

            $('.count_pay_mono').text( (count_pay*1+1) );
            $('#parts_mono_select').val(count_pay);
        }


    }

    function set_cookie(name, value, exp_y, exp_m, exp_d, path, domain, secure) {
        var cookie_string = name + "=" + escape(value);

        if (exp_y) {
            var expires = new Date(exp_y, exp_m, exp_d);
            cookie_string += "; expires=" + expires.toGMTString();
        }

        if (path)
            cookie_string += "; path=" + escape(path);

        if (domain)
            cookie_string += "; domain=" + escape(domain);

        if (secure)
            cookie_string += "; secure";

        document.cookie = cookie_string;
    }
    function get_cookie ( cookie_name )
    {
        var results = document.cookie.match ( '(^|;) ?' + cookie_name + '=([^;]*)(;|$)' );

        if ( results )
            return ( unescape ( results[2] ) );
        else
            return null;
    }
</script>
<style>
    .privat_price_mono{
        padding: 4px;
        background: rgba(255, 235, 59, 0.3);
        border-radius: 4px;
        font-size: 18px;
        font-weight: bold;
    }
    @media screen and (max-width: 980px) {
        div#mono_panel {
            min-width: 255px !important;
        }
    }
</style>