<?php echo $header; ?>
<div class="container">
<div class="row">
<div id="cont" class="col-sm-12" itemscope itemtype="http://schema.org/Product">
<?php echo $column_left; ?>
<?php if ($column_left && $column_right) { ?>
<?php $class = 'col-sm-6'; ?>
<?php } elseif ($column_left || $column_right) { ?>
<?php $class = 'col-aridius'; ?>
<?php } else { ?>
<?php $class = 'col-sm-12'; ?>
<?php } ?>
<div id="content" class="<?php echo $class; ?>">
<?php echo $content_top; ?>
<ul class="breadcrumb" itemscope itemtype="http://data-vocabulary.org/Breadcrumb">
<?php foreach ($breadcrumbs as $i=> $breadcrumb) { ?>
<li><?php if($i+1<count($breadcrumbs)) { ?><a href="<?php echo $breadcrumb['href']; ?>" itemprop="url" ><?php echo $breadcrumb['text']; ?></a><?php } else { ?><span itemprop="title"><?php echo $breadcrumb['text']; ?></span><?php } ?></li>
<?php } ?>
</ul>
<h1 class="title_h title_center name_prod_h1" itemprop="name"><?php echo $heading_title; ?></h1>
<?php if ($modern_info_block != 1) { ?>
<div class="row">
<div class="col-lg-12 col-md-12 col-sm-12 hidden-xs block_product">
<div class="row">
<?php if ($modern_top_links9 ) { ?>
<?php foreach ($modern_top_links9 as $modern_top_link9) { ?>
<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
<div class="product-info">
<div class="">
<table class="table">
<tbody>
<tr>
<td style="text-align:center;"><img class="img_tabl" src="<?php echo $modern_top_link9['image_href']; ?>" alt=""/></td>
<td>
<div class="text-product-info"><?php echo html_entity_decode($modern_top_link9['description'][$language_id]); ?></div>
</td>
</tr>
</tbody>
</table>
</div>
</div>
</div>
<?php } ?>
<?php } ?>
<?php echo html_entity_decode($modern_product_info_block[$language_id]); ?>
</div>
</div>
</div>
<?php } ?>
<ul class="nav nav-tabs tabs-aridius mod fixzoom">
<li class="active col-xs-12 tab_padding"><a data-toggle="tab" href="#description"><?php echo $tab_description; ?> <i class="fa fa-caret-down hidden"></i></a></li>
<?php if ($attribute_groups) { ?>
<li class="col-xs-12 tab_padding"><a data-toggle="tab" href="#attribute_tab"><?php echo $tab_attribute; ?> <i class="fa fa-caret-down hidden"></i></a></li>
<?php } ?>
<?php if ($review_status) { ?>
<li class="col-xs-12 tab_padding"><a data-toggle="tab" href="#tab-review"><?php echo $tab_review; ?> <i class="fa fa-caret-down hidden"></i></a></li>
<?php } ?>
<?php /*if ($products && !$modern_product_recom) { ?>
<li class="col-xs-12 tab_padding"><a data-toggle="tab" href="#tab-accessories" id="tab-accessories_active"><?php echo $text_related; ?> <i class="fa fa-caret-down hidden"></i></a></li>
<?php } */?>
<?php foreach($product_tabs as $key => $tab){ ?>
<li class="col-xs-12 tab_padding"><a href="#tab-<?php echo $product_id ?>-<?php echo $tab['product_tab_id']; ?>" data-toggle="tab"><?php echo $tab['title']; ?></a></li>
<?php } ?>
<?php if ($modern_top_links7 ) { ?>
<?php foreach ($modern_top_links7 as $key => $modern_top_link7) { ?>
<?php if ($modern_top_link7['title'][$language_id]) { ?> <li class="col-xs-12 tab_padding"><a href="#other_tab-<?php echo $key ?>" data-toggle="tab"><?php echo $modern_top_link7['title'][$language_id]; ?> <i class="fa fa-caret-down hidden"></i></a></li><?php } ?>
<?php } ?>
<?php } ?>
</ul>
<div class="tab-content">
<div class="row">
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
<div class="row">
<?php if ($modern_info_block !=0) { ?>
<?php $class = 'col-lg-4 col-md-4 col-sm-6 col-xs-12 thumbnails-fix'; ?>
<?php } else { ?>
<?php $class = 'col-lg-6 col-md-6 col-sm-6 col-xs-12 thumbnails-fix'; ?>
<?php } ?>
<div class="<?php echo $class; ?>">
<div class="row border-right">
<?php if ($images && !$modern_product_position_img) { ?>
<div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 padding_no_right prod-img-left" id="block_foto" >
<?php } else { ?>
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" id="block_foto" >
<?php } ?>
<?php if (($special && $special_date_end > $special_date_start)&&($modern_product_timer !=1)) { ?>
<div class="special-timer-all">
<div class = "text-time"><?php echo $text_end_stock; ?></div>
<div class = "special-timere-zone">
<div id = "time_out_pr"></div>
</div>
</div>
<?php } ?>
<div class="prmain">
<div class="positionsticker">
<!-- special -->
<?php if ($modern_sticker_sale_product_auto !=1 && $special) { ?>
<div class="stickers-special"><span class="diamont_st">-<?php echo $saving_product; ?>%</span></div>
<?php } ?>
<!-- special END -->
<!-- new -->
<?php
$startDate1 = strtotime(mb_substr($dateadded, 0, 10));
$endDate2 = strtotime(date("Y-m-d"));
$days = ceil(($endDate2 / 86400)) - ceil(($startDate1 / 86400));
?>
<?php if($modern_sticker_new_product_auto !=1 && $days < $modern_sticker_product_new_day || $modern_sticker_new_product_auto !=0 && $stickers == 1) { ?>
<div class="stickers-new"><span class="diamont_st"><?php echo $modern_name_sticker_product_new[$language_id]; ?></span></div>
<?php } ?>
<!-- new END -->
<!-- top -->
<?php if ($modern_sticker_top_product_auto !=1 && $modern_sticker_product_top_ratinr == 1 && $rating == $modern_sticker_product_top_rating || $modern_sticker_top_product_auto !=1 && $modern_sticker_product_top_ratinr == 2 && $viewed >  $modern_sticker_product_top_viewed || $modern_sticker_top_product_auto !=0 && $stickers == 2 ) { ?>
<div class="stickers-top"><span class="diamont_st"><?php echo $modern_name_sticker_product_top[$language_id]; ?></span></div>
<?php } ?>
<!-- top END -->
</div>
<ul class="thumbnails">
<?php if ($thumb) { ?>
<li><a class="thumbnail imglink" itemprop="image" href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" >
<img id="main-image" src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" data-zoom-image="<?php echo $popup; ?>" /></a>
</li>
<?php } ?>
</ul>
</div>
</div>
<?php if ($images) { ?>
<?php if (!$modern_product_position_img) { ?>
<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 padding_no_left padding_no_right opacity_block prod-img-right" id="image-addit">
<div class="addit-button-prev"></div>
<div id="image-additional2" class="swiper-container">
<div class="swiper-wrapper">
<?php if ($thumb_add) { ?>
<div class="image-additional mini_foto mini_foto2 swiper-slide"><a href="<?php echo $popup; ?>" class="thumbnail quantity_foto active_add" title="<?php echo $heading_title; ?>" data-image="<?php echo $thumb; ?>" data-zoom-image="<?php echo $popup; ?>">
<img src="<?php echo $thumb_add; ?>" alt="<?php echo $heading_title; ?>" ></a>
</div>
<?php } ?>
<?php foreach ($images as $key => $image) { ?>
<div class="image-additional mini_foto2 swiper-slide"><a href="<?php echo $image['popup']; ?>" class="thumbnail imglink quantity_foto" title="<?php echo $heading_title; ?>" data-image="<?php echo $image['thumb2']; ?>" data-zoom-image="<?php echo $image['popup']; ?>">
<img <?php if ($key == 0) { ?> id="mini_foto" <?php } ?> src="<?php echo $image['thumb']; ?>" alt="<?php echo $heading_title; ?>" /></a>
</div>
<?php } ?>
</div>
</div>
<div class="addit-button-next"></div>
</div>
<?php } else { ?>
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 padding_30">
<div class="addit-button-hor-prev"></div>
<div id="image-additional2" class="swiper-container">
<div class="swiper-wrapper">
<?php if ($thumb_add) { ?>
<div class="mini_foto2 swiper-slide"><a href="<?php echo $popup; ?>" class="thumbnail quantity_foto active_add" title="<?php echo $heading_title; ?>" data-image="<?php echo $thumb; ?>" data-zoom-image="<?php echo $popup; ?>">
<img src="<?php echo $thumb_add; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" ></a>
</div>
<?php } ?>
<?php foreach ($images as $key => $image) { ?>
<div class="mini_foto2 swiper-slide"><a class="thumbnail imglink quantity_foto" href="<?php echo $image['popup']; ?>" data-image="<?php echo $image['thumb2']; ?>" data-zoom-image="<?php echo $image['popup']; ?>">
<img <?php if ($key == 0) { ?> id="mini_foto" <?php } ?> src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a>
</div>
<?php } ?>
</div>
</div>
<div class="addit-button-hor-next"></div>
</div>
<?php } ?>
<?php } ?>
</div>
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" id="block_melody">
<?php if($audios) { ?>
<div class="btn-melody">
<img id="icon-melody" src="/image/catalog/music-library.png">
</div>
<?php } ?>
<?php if($videos) { ?>
<div class="btn-video">
<img id="icon-video" src="/image/catalog/video.png">
</div>
<?php } ?>
</div>
</div>
<?php if ($modern_info_block !=0 && $modern_top_links9) { ?>
<?php $class = 'col-lg-4 col-md-4 col-sm-6 col-xs-12'; ?>
<?php } elseif (!$modern_product_position_img) { ?>
<?php $class = 'col-lg-6 col-md-6 col-sm-6 col-xs-12'; ?>
<?php } else { ?>
<?php $class = 'col-lg-8 col-md-8 col-sm-6 col-xs-12'; ?>
<?php } ?>
<div class="<?php echo $class; ?>">
<?php if ($sales) { ?>
<?php foreach($sales as $sale) { ?>
<div class="action-info clearfix">
<div class="img-box">
<img src="<?php echo $sale['image']; ?>" class="img-responsive" alt="<?php echo $sale['title']; ?>">
</div>
<div class="text-box">
<p class="title"><?php echo $text_special; ?></p>
<a href="<?php echo $sale['href']; ?>"><?php echo $sale['title']; ?></a>
</div>
</div>
<?php } ?>
<?php } ?>
<div class="linetoppr">
<?php if ($review_status) { ?>
<div class="rating">
<p>
<?php for ($i = 1; $i <= 5; $i++) { ?>
<?php if ($rating < $i) { ?>
<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
<?php } else { ?>
<span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
<?php } ?>
<?php } ?>
<a class="review_profile" href="" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;">&nbsp;&nbsp;<?php echo $reviews; ?></a> <span>/</span> <a class="review_profile" href="" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;"><?php echo $text_write; ?></a>
<?php if ($rating) { ?>
<span itemprop="aggregateRating" itemscope itemtype = "http://schema.org/AggregateRating">
<meta itemprop='ratingValue' content='<?php echo $rating; ?>' />
<meta itemprop='bestRating' content='5' />
<meta itemprop='worstRating' content='1' />
<meta itemprop="reviewCount" content="<?php echo rtrim(preg_replace("/[^0-9\.]/", "", ($reviews)), '.'); ?>" />
</span>
<?php } ?>
</p>
</div>
<?php } ?>
</div>
<ul class="list-unstyled">
<?php if ($manufacturer) { ?>
<?php if ($modern_product_man_img !=1) { ?>
<li><a href="<?php echo $manufacturers; ?>">
<?php if( isset($manufacturer_img) ) { ?>
<img  class="pull-right" src="<?php echo $manufacturer_img ; ?>" alt="<?php echo $manufacturer; ?>" title="<?php echo $manufacturer; ?>">
<?php } ?>
</a></li>
<?php } ?>
<meta itemprop="brand" content="<?php echo $manufacturer; ?>">
<?php if ($sku) { ?>
<meta itemprop="sku" content="<?php echo $sku; ?>">
<?php } else { ?>
<meta itemprop="sku" content="<?php echo $model; ?>">
<?php } ?>
<?php if ($mpn) { ?>
<meta itemprop="mpn" content="<?php echo $mpn; ?>">
<?php } ?>
<li><span><?php echo $text_manufacturer; ?></span>&nbsp;&nbsp;<a itemprop="manufacturer" href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a></li>
<?php } ?>
<li><?php echo $text_stock; ?>&nbsp;&nbsp;<?php echo ($quantity > 0) ? '<span class = "rewardin">'. $stock .'</span>' : '<span class = "rewardoff">'. $stock .'</span>'; ?></li>
<?php if ($modern_product_kod_tovara !=1) { ?>
<li><span><?php echo $text_model; ?></span>&nbsp;&nbsp;<span itemprop="model"><?php echo $model; ?></span></li>
<?php } ?>
<?php if ($reward) { ?>
<li><span><?php echo $text_reward; ?></span>&nbsp;&nbsp;<?php echo $reward; ?></li>
<?php } ?>
<?php if ($length && $width && $height && $modern_product_size !=1 ) { ?>
<li><?php if ($length > 0) { ?><?php echo $text_lengthp; ?> <?php echo $length; ?> <?php if (($length > 0 && $width > 0)||($length > 0 && $height > 0)) { ?>x<?php } ?> <?php } ?><?php if ($width > 0) { ?><?php echo $text_widthp; ?> <?php echo $width; ?> <?php if ($width > 0 && $height > 0) { ?>x<?php } ?> <?php } ?><?php if ($height > 0) { ?><?php echo $text_heightp; ?> <?php echo $height; ?><?php } ?></li>
<?php } ?>
<?php if ($weight > 0 && $modern_product_weight !=1 ) { ?>
<li><?php echo $text_weightp; ?> <?php echo $weight; ?></li>
<?php } ?>
<?php if ($modern_product_show_sku !=1) { ?>
<li><?php if ($sku) { echo $modern_product_sku[$language_id]; } ?> <?php echo $sku; ?></li>
<?php } ?>
<?php if ($modern_product_show_upc !=1) { ?>
<li><?php if ($upc) { echo $modern_product_upc[$language_id]; } ?> <?php echo $upc; ?></li>
<?php } ?>
<?php if ($modern_product_show_ean !=1) { ?>
<li><?php if ($ean) { echo $modern_product_ean[$language_id]; } ?> <?php echo $ean; ?></li>
<?php } ?>
<?php if ($modern_product_show_jan !=1) { ?>
<li><?php if ($jan) { echo $modern_product_jan[$language_id]; } ?> <?php echo $jan; ?></li>
<?php } ?>
<?php if ($aridius_popupsize_status && $popupsize == 1) { ?>
<li> <i class="fa fa-calendar"></i>&nbsp;<a class="popup-modal" href="#popup-modal"><?php echo $aridius_popupsize_name[$language_id]; ?></a> </li>
<?php } ?>
</ul>
<hr>
<?php if ($price) { ?>
<span itemprop="offers" itemscope itemtype = "http://schema.org/Offer">
<meta itemprop="price" content="<?php echo rtrim(preg_replace("/[^0-9\.]/", "", ($special ? $special : $price)), '.'); ?>" />
<meta itemprop="priceCurrency" content="<?php echo $sh_currency; ?>" />
<link itemprop = "availability" href = "https://schema.org/<?php echo ($quantity>0 ? "InStock" : "OutOfStock") ?>" />
<?php if ($special && $special_date_end > $special_date_start) { ?>
<meta itemprop="priceValidUntil" content="<?php echo $special_date_end; ?>" />
<?php } ?>
<meta itemprop="url" content="<?php echo $hrefs; ?>" />
</span>
<div class="line-product">
<?php if (!$special) { ?>
<span class="priceproduct-new"><?php echo $price; ?></span>
<?php } else { ?>
<span class="priceproduct-new"><?php echo $special; ?></span>&nbsp;&nbsp;<span class="priceproduct-old"><?php echo $price; ?></span>
<?php } ?><br />
<?php if ($aridiusundersell_status) { ?>
<i class="fa fa-area-chart" aria-hidden="true"></i>&nbsp;<a id="undersell-order"><?php echo $buttonundersell_title; ?></a>
<?php } ?>
</div>
<ul class="list-unstyled">
<?php if ($tax) { ?>
<li><?php echo $text_tax; ?> <?php echo $tax; ?></li>
<?php } ?>
<?php if ($points) { ?>
<li><?php echo $text_points; ?> <?php echo $points; ?></li>
<?php } ?>
<?php if ($discounts) { ?>
<li>
<hr>
</li>
<?php foreach ($discounts as $discount) { ?>
<li><?php echo $discount['quantity']; ?><?php echo $text_discount; ?><?php echo $discount['price']; ?></li>
<?php } ?>
<?php } ?>
</ul>
<?php } ?>
<div id="product">
<?php if ($options) { ?>
<hr>
<h3><?php echo $text_option; ?></h3>
<?php foreach ($options as $option) { ?>
<?php if ($option['type'] == 'select') { ?>
<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
<select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
<option value=""><?php echo $text_select; ?></option>
<?php foreach ($option['product_option_value'] as $option_value) { ?>
<option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
<?php if ($option_value['price']) { ?>
(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
<?php } ?>
</option>
<?php } ?>
</select>
</div>
<?php } ?>
<?php if ($option['type'] == 'radio') { ?>
<div class="options_group form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
<label class="control-label"><?php echo $option['name']; ?></label>
<div id="input-option<?php echo $option['product_option_id']; ?>">
<?php foreach ($option['product_option_value'] as $option_value) { ?>
<div class="radio">
<label>
<?php if ($option_value['image']) { ?>
<span class="opthe">
<input class="optstyle" type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
<img src="<?php echo $option_value['image']; ?>" data-toggle="tooltip" data-placement="top" title="<?php echo $option_value['name']; ?>" <?php if (!$modern_product_option_form) { ?> class="img-thumbnail imgpopcat cirle_opt" <?php } else { ?>class="img-thumbnail imgpopcat" <?php } ?><?php if ($option_value['image_opt']) { ?> data-zoom-image="<?php echo $option_value['image_opt']; ?>" data-image="<?php echo $option_value['image_opt_main']; ?>" <?php } else { ?> data-zoom-image="<?php echo $option_value['popup']; ?>" data-image="<?php echo $option_value['optthumb']; ?>" <?php } ?> alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" />
<?php if ($option_value['price']) { ?>
<br />
<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>
<?php } ?>
</span>
<?php } else { ?>
<input type="radio" class="options_none" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
<span class="im_option"><?php echo $option_value['name']; ?></span>
<?php if ($option_value['price']) { ?>
<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>
<?php } ?><span class = "options-prheight"></span>
<?php } ?>
</label>
</div>
<?php } ?>
</div>
</div>
<?php } ?>
<?php if ($option['type'] == 'checkbox') { ?>
<div class="options_group form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
<label class="control-label"><?php echo $option['name']; ?></label>
<div id="input-option<?php echo $option['product_option_id']; ?>">
<?php foreach ($option['product_option_value'] as $option_value) { ?>
<div class="checkbox">
<label>
<?php if ($option_value['image']) { ?>
<span class="opthe">
<input class="optstyle" type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" />
<img src="<?php echo $option_value['image']; ?>" data-toggle="tooltip" data-placement="top" title="<?php echo $option_value['name']; ?>" <?php if (!$modern_product_option_form) { ?> class="img-thumbnail imgpopcat cirle_opt" <?php } else { ?>class="img-thumbnail imgpopcat" <?php } ?> <?php if ($option_value['image_opt']) { ?> data-zoom-image="<?php echo $option_value['image_opt']; ?>" data-image="<?php echo $option_value['image_opt_main']; ?>" <?php } else { ?> data-zoom-image="<?php echo $option_value['popup']; ?>" data-image="<?php echo $option_value['optthumb']; ?>" <?php } ?> alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" />
<?php if ($option_value['price']) { ?>
<br />
<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>
<?php } ?>
</span>
<?php } else { ?>
<input type="checkbox" class="options_none" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" />
<span class="im_option"><?php echo $option_value['name']; ?></span>
<?php if ($option_value['price']) { ?>
<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>
<?php } ?><span class = "options-prheight"></span>
<?php } ?>
</label>
</div>
<?php } ?>
</div>
</div>
<?php } ?>
<?php if ($option['type'] == 'text') { ?>
<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
</div>
<?php } ?>
<?php if ($option['type'] == 'textarea') { ?>
<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
<textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"><?php echo $option['value']; ?></textarea>
</div>
<?php } ?>
<?php if ($option['type'] == 'file') { ?>
<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
<label class="control-label"><?php echo $option['name']; ?></label>
<button type="button" id="button-upload<?php echo $option['product_option_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btn-block"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
<input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id']; ?>" />
</div>
<?php } ?>
<?php if ($option['type'] == 'date') { ?>
<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
<div class="input-group date">
<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
<span class="input-group-btn">
<button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
</span>
</div>
</div>
<?php } ?>
<?php if ($option['type'] == 'datetime') { ?>
<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
<div class="input-group datetime">
<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
<span class="input-group-btn">
<button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
</span>
</div>
</div>
<?php } ?>
<?php if ($option['type'] == 'time') { ?>
<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
<div class="input-group time">
<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
<span class="input-group-btn">
<button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
</span>
</div>
</div>
<?php } ?>
<?php } ?>
<?php } ?>
<?php if ($recurrings) { ?>
<hr>
<h3><?php echo $text_payment_recurring; ?></h3>
<div class="form-group required">
<select name="recurring_id" class="form-control">
<option value=""><?php echo $text_select; ?></option>
<?php foreach ($recurrings as $recurring) { ?>
<option value="<?php echo $recurring['recurring_id']; ?>"><?php echo $recurring['name']; ?></option>
<?php } ?>
</select>
<div class="help-block" id="recurring-description"></div>
</div>
<?php } ?>
<div class="form-group plus_minus">
<div class="pull-left">
<input type="text" name="quantity" value="<?php echo $minimum; ?>" data-toggle="tooltip" title="<?php echo $entry_qty; ?>" size="2" id="input-quantity" class="form-control" />
<input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
</div>
<div class="custom pull-left">
<button type="button" id="plus" class="items-count" ><i class="fa fa-angle-up">&nbsp;</i></button>
<button type="button" id="minus" class="items-count"><i class="fa fa-angle-down">&nbsp;</i></button>
</div>
&nbsp;&nbsp;&nbsp;
<?php if ($modern_wishlist_cat !=1) { ?>
<button type="button" data-toggle="tooltip" class="btn-wishlist" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product_id; ?>');"><i class="fa fa-heart"></i></button>
<?php } ?>
<?php if ($modern_compare_cat !=1) { ?>
<button type="button" data-toggle="tooltip" class="btn-compare" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product_id; ?>');"><i class="fa fa-exchange"></i></button>
<?php } ?>
<div class="clearfix"></div>
<br />
<div class="cart pull-left">
<?php if ($quantity <= 0 && $aridiusinstock_status ) { ?>
<button type="button" class="btn-instock" onclick="instock.add('<?php echo $product_id; ?>');" data-product-id="<?php echo $product_id; ?>"><?php echo $button_instock; ?></button>
<?php } else { ?>
<button type="button" id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="btn-cart"><i class="fa fa-shopping-cart"></i> <?php echo $button_cart; ?></button>
<?php if ($aridiusfastorder_status) { ?>
<button type="button" id="fast-order" class="btn-cart"><i class="fa fa-clock-o"></i> <?php echo $button_title; ?></button>
<?php } ?>
<?php } ?>
<div class="clearfix"></div>
<br />
<?php if ($stock_status_id != 9) { ?>
    <!--credit-->
<?php } ?>
</div>
<div class="clearfix"></div>
</div>
<?php if ($benefits) { ?>
<div class="present">
<?php foreach ($benefits as $benefit) { ?>
<?php if ($benefit['type'] == 0) { ?>
<div>
<?php if (!$benefit['link']) { ?>
<span class="thumb"><img class="img-responsive" src="<?php echo $benefit['thumb']; ?>" alt="<?php echo $benefit['name']; ?>" /></span>
<?php } else { ?>
<a href="<?php echo $benefit['link']; ?>" target="_blank" title="<?php echo $benefit['name']; ?>"><span class="thumb"><img class="img-responsive" src="<?php echo $benefit['thumb']; ?>" alt="<?php echo $benefit['name']; ?>" /></span></a>
<?php } ?>
</div>
<?php } ?>
<?php } ?>
</div>
<?php } ?>
<?php if ($benefits) { ?>
<div class="benefits col-sm-12">
<ul class="benefit list-inline">
<?php foreach ($benefits as $benefit) { ?>
<?php if ($benefit['type'] == 1) { ?>
<li class="">
<?php if (!$benefit['link']) { ?>
<span class="thumb"><img class="img-responsive" src="<?php echo $benefit['thumb']; ?>" alt="<?php echo $benefit['name']; ?>" /></span>
<?php } else { ?>
<a href="<?php echo $benefit['link']; ?>" target="_blank" title="<?php echo $benefit['name']; ?>"><span class="thumb"><img class="img-responsive" src="<?php echo $benefit['thumb']; ?>" alt="<?php echo $benefit['name']; ?>" /></span></a>
<?php } ?>
<?php if ($benefit['description']) { ?>
<div class="benefit_description"><?php echo $benefit['description']; ?></div>
<?php } ?>
</li>
<?php } ?>
<?php } ?>
</ul>
</div>
<?php } ?>
<div class="clearfix"></div>
<?php if ($minimum > 1) { ?>
<div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?></div>
<?php } ?>
</div>
<?php if ($modern_product_show_share !=1) { ?>
<div class="rating">
<p>
<?php if (empty($modern_share)) { ?>
<!-- AddThis Button BEGIN -->
<div class="addthis_toolbox addthis_default_style" data-url="<?php echo $share; ?>"><a class="addthis_button_facebook_like" fb:like:layout="button_count"></a> <a class="addthis_button_tweet"></a> <a class="addthis_button_pinterest_pinit"></a> <a class="addthis_counter addthis_pill_style"></a></div>
<script  src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-515eeaf54693130e"></script>
<!-- AddThis Button END -->
<?php } else { ?>
<?php echo htmlspecialchars_decode($modern_share);?>
<?php } ?>
</div>
<?php } ?>
<br />
</div>
<?php if ($modern_info_block !=0 && $modern_top_links9) { ?>
<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 block_product">
<?php if ($modern_top_links9) { ?>
<?php foreach ($modern_top_links9 as $modern_top_link9) { ?>
<div class="product-info">
<div class="">
<table class="table">
<tbody>
<tr>
<td style="text-align:center;"><img class="img_tabl" src="<?php echo $modern_top_link9['image_href']; ?>" alt=""/></td>
<td>
<div class="text-product-info"><?php echo html_entity_decode($modern_top_link9['description'][$language_id]); ?></div>
</td>
</tr>
</tbody>
</table>
</div>
</div>
<?php } ?>
<?php } ?>
<?php echo html_entity_decode($modern_product_info_block[$language_id]); ?>
</div>
<?php } ?>
</div>
</div>
</div>
<div id="description" class="tab-pane fade in active">
<?php if ($description || $description_mini) { ?>
<?php $string = strlen(strip_tags($description)); ?>
<div class="title_center"><?php echo $tab_description; ?></div>
<div class="description_product">
<div class="description_pr" itemprop="description" <?php if ($string < 400) { echo 'style="padding-bottom:16px"';}?>>
<div class="description_mini"><?php echo $description_mini; ?></div>
<div class="description_full"><?php echo $description; ?></div>
</div>
<?php if ($string > 400) { ?>
<a href="javasript:;" class="spoiler"><?php echo $text_more; ?></a>
<?php } ?>
</div>
<?php } ?>
<?php if ($description || $attribute_groups) { ?>
<input type="hidden" class="spoiler-more" value="<?php echo $text_more; ?>">
<input type="hidden" class="spoiler-value" value="<?php echo $text_more_end; ?>">
<?php } ?>
<div class="accessories">
<div class="row">
<?php if ($attribute_groups) { ?>
<!-- Atribute start -->
<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
<div class="attrs">
<h3 class="title_bordered"><?php echo $attribute_tab_title; ?><?php //echo $tab_attribute; ?></h3>
<div class="attributes description_product">
<div class="">
<?php foreach ($attribute_groups as $attribute_group) { ?>
<strong><?php echo $attribute_group['name']; ?></strong>
<?php foreach ($attribute_group['attribute'] as $attribute) { ?>
<ul class="atr">
<li class="art_bottom_line"><span class="art_top"><?php echo $attribute['name']; ?></span><span class="art_top"><?php echo $attribute['text']; ?></span></li>
</ul>
<?php } ?>
<?php } ?>
</div>
</div>
</div>
</div>
<!-- Atribute end -->
<?php } ?>
<?php if ($review_status) { ?>
<!-- Review start -->
<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
<div class="tab_block">
<form class="form-horizontal" id="form-review">
<div id="review"></div>
<span class="text-write"><?php echo $text_write; ?></span>
<?php if ($review_guest) { ?>
<div class="form-group required">
<div class="col-sm-12">
<label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
<input type="text" name="name" value="<?php echo $customer_name; ?>" id="input-name" class="form-control" />
</div>
</div>
<div class="form-group required">
<div class="col-sm-12">
<label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
<textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
</div>
</div>
<div class="form-group">
<div class="col-sm-12">
<label for="input-dignity"><?php echo $text_dignity; ?></label>
<input type="text" name="dignity" id="input-dignity" class="form-control">
</div>
</div>
<div class="form-group">
<div class="col-sm-12">
<label for="input-limitations"><?php echo $text_limitations; ?></label>
<input type="text" name="limitations" id="input-limitations" class="form-control">
</div>
</div>
<div class="help-block"><?php echo $text_note; ?></div>
<div class="form-group required">
<div class="col-sm-12">
<label class="control-label"><?php echo $entry_rating; ?></label>
<input type="hidden" name="rating" value="<?php echo $modern_product_raiting; ?>" class="rating-tooltip"/>
</div>
</div>
<?php echo $captcha; ?>
<div class="buttons clearfix">
<div class="pull-right">
<button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn-cart"><?php echo $button_continue; ?></button>
</div>
</div>
<?php } else { ?>
<?php echo $text_login; ?>
<?php } ?>
</form>
</div>
</div>
<!-- Review end -->
<?php } ?>
</div>
</div>
<!-- Last Reviews start -->
<?php if ($review_status) { ?>
<div id="reviewlast"></div>
<?php } ?>
<!-- Last Reviews end -->
<!-- Audio start -->
<?php if ($audios) { ?>
<hr>
<div id="audio">
<h3 class="title_h title_center"><?php echo $text_audio; ?></h3>
<ul class="list-group">
<!--<audio id="myAudio" src="<?php echo $audios[0]['link'];?>"></audio>-->
<br>
<ol>
<br>
<audio id="myAudio" src="<?php echo $audios[0]['link'];?>"></audio>
<br>
<?php foreach($audios as $audio) { ?>
<br>
<li><a href="#" data-src="<?php echo $audio['link'];?>"><?php echo $audio['name'];?></a></li><span class="size" style="float: right;"><?php echo $audio['size'];?></span>
<br>
<hr>
<?php } ?>
</ol>
</ul>
</div>
<script src="system/audiojs/audio.min.js"></script>
<script type="text/javascript">
audiojs.events.ready(function() {
var as = audiojs.createAll();
});
</script>
<script type="text/javascript">
$('ol li').click(function(e) {
e.preventDefault();
var href = $(this).find('a').attr('data-src');
document.getElementById('myAudio').setAttribute('src', href);
document.getElementById('myAudio').play();
$(".audiojs").last().addClass("playing");
//$(".play").click();
});
$('#icon_muzon').click(function () {
document.getElementById('myAudio').play();
});
$('#icon-melody').click(function () {
$('html,body').animate({scrollTop:$('#audio').offset().top-80},{duration:1E3});
});
$('#icon-video').click(function () {
$('html,body').animate({scrollTop:$('#video').offset().top-80},{duration:1E3});
});
</script>
<?php } ?>
<?php if ($ean || $videos) { ?>
<!-- Video start -->
<div id="video">
<h3 class="title_h title_center"><?php echo $text_video; ?><?php echo $heading_title; ?></h3>
<div class="row">
<section class="detail-video" id="">
<div class="detail-video-container">
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 video-item">
<div class="detail-video-only-wrap">
<div class="responsive-video">
<iframe width="560" height="315" src="https://www.youtube.com/embed/<?php echo $ean; ?>" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</div>
</div>
<?php if ($videos) { ?>
<?php foreach ($videos as $video) { ?>
<div class="">
<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
<iframe width="100%" height="" src="https://www.youtube.com/embed/<?php echo $video['link']; ?>" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</div>
</div>
<?php } ?>
<?php }	?>
</div>
</div>
</section>
</div>
</div>
<!-- Video end -->
<?php } ?>
<?php if($ard_quckview) { ?>
<div id="ard_quckview"><?php echo $ard_quckview;?></div>
<?php } ?>
<?php if ($products && $modern_product_recom) { ?>
<div class="related-categories">
<script>
$(document).ready(function(){new Swiper("#accessories_carusel_cont.swiper-container",{slidesPerView:4,watchSlidesVisibility:!0,watchSlidesProgress:!0,loop:!1,preloadImages:!0,updateOnImagesReady:!0,grabCursor:!0,autoHeight:!0,touchMoveStopPropagation:!0,autoplayDisableOnInteraction:!0,slideVisibleClass:"swiper-slide-visible",navigation:{nextEl:".accessories-button-next",prevEl:".accessories-button-prev"},breakpoints:{1599:{slidesPerView:4},1199:{slidesPerView:3},768:{slidesPerView:2},479:{slidesPerView:1}},on:{imagesReady:function(){$("#accessories_carusel").css("height",this.height+"px");var a=$(".accessories-imgsize").height()/2;$("#accessories_carusel .button_swiper_car").css("top",a+15+"px"),$("#accessories_carusel .swiper-lazy-preloader").css("top",a+"px")},resize:function(){$("#accessories_carusel").css("height",this.height+"px");var a=$(".accessories-imgsize").height()/2;$("#accessories_carusel .button_swiper_car").css("top",a+15+"px"),$("#accessories_carusel .swiper-lazy-preloader").css("top",a+"px")}}})});
</script>
<h3 class="title_h title_center"><?php echo $text_related; ?></h3>
<?php if ($related_categories) { ?>
<ul class="category">
<li class="m-tabs-i"><a name="menu_item" class="novisited m-tabs-all active"><?php echo $text_related_cat; ?></a></li>
<?php foreach ($related_categories as $category) { ?>
<li class="m-tabs-i"><a category_id="<?php echo $category['id'];?>" name="menu_item" class="novisited m-tabs-link"><?php echo $category['name'];?></a> </li>
<?php } ?>
</ul>
<?php } ?>
<div class="padding-carusel row" id="accessories_carusel">
<div id="accessories_carusel_cont" class="swiper-container padding_swiper button-next-prev">
<div class="swiper-wrapper">
<?php foreach ($products as $key => $product) { ?>
<div class="product-layoutcatnew swiper-slide" id="<?php echo $product['category_id'];?>">
<?php if (!$modern_arrows) { ?>
<div class="swiper-button-prev<?php echo $key ?> button_prev button_swiper_car">
<i class="fa fa-arrow-left"></i>
</div>
<div class="swiper-button-next<?php echo $key ?> button_next button_swiper_car" >
<i class="fa fa-arrow-right"></i>
</div>
<?php } ?>
<div class="product-layout2">
<div class="border product-thumb">
<div class="caption">
<div id="imgCarousel-accessories<?php echo $key ?>">
<div class="accessories_block swiper-container">
<?php if (!$modern_other1) { ?><button class="button_img_quick" data-toggle="tooltip" title="<?php echo $button_quickview; ?>" onclick="quickview_open('<?php echo $product['product_id']; ?>');"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x"></i><i class="fa fa-search fa-stack-1x fa-inverse"></i></span></button><?php } ?>
<div class="swiper-wrapper">
<div class="item swiper-slide">
<a href="<?php echo $product['href']; ?>"><img class="accessories-imgsize img-responsive center-add_img" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
</div>
<?php foreach ($product['images'] as $key2 => $image) { ?>
<div class="item swiper-slide addit_lazy">
<a href="<?php echo $product['href']; ?>"><img class="swiper-lazy img-responsive center-add_img" src="catalog/view/theme/modern/image/background_white.jpg" alt="<?php echo $product['name']; ?>-foto<?php echo $key2+2 ?>" data-src="<?php echo $image['thumb']; ?>"/></a>
<div class="swiper-lazy-preloader"></div>
</div>
<?php } ?>
</div>
</div>
<script>
$(document).ready(function () { var accessoriesSwiper<?php echo $key ?> = new Swiper('#imgCarousel-accessories<?php echo $key ?> .swiper-container', { simulateTouch:false, preloadImages: false, autoHeight:false, loop: false, lazy: true, navigation: { nextEl: '#accessories_carusel .swiper-button-next<?php echo $key ?>', prevEl: '#accessories_carusel .swiper-button-prev<?php echo $key ?>' }, }) });
</script>
<div class="positionsticker">
<!-- special -->
<?php if ($modern_sticker_sale_product_auto !=1 && $product['special'] && $product['price_sticker'] != 0) { ?>
<?php  $percent = round(100 - ($product['special_sticker'] / $product['price_sticker']) * 100); ?>
<div class="stickers-special">-<?php echo $percent; ?>%</div>
<?php } ?>
<!-- special END -->
<!-- new -->
<?php
$startDate1 = strtotime(mb_substr($product['dateadded'], 0, 10));
$endDate2 = strtotime(date("Y-m-d"));
$days = ceil(($endDate2 / 86400)) - ceil(($startDate1 / 86400));
?>
<?php if($modern_sticker_new_product_auto !=1 && $days < $modern_sticker_product_new_day || $modern_sticker_new_product_auto !=0 && $product['stickers'] == 1) { ?>
<div class="stickers-new"><?php echo $modern_name_sticker_product_new[$language_id]; ?></div>
<?php } ?>
<!-- new END -->
<!-- top -->
<?php if ($modern_sticker_top_product_auto !=1 && $modern_sticker_product_top_ratinr == 1 && $product['rating'] == $modern_sticker_product_top_rating || $modern_sticker_top_product_auto !=1 && $modern_sticker_product_top_ratinr == 2 || $modern_sticker_top_product_auto !=0 && $product['stickers'] == 2 ) { ?>
<div class="stickers-top"><?php echo $modern_name_sticker_product_top[$language_id]; ?></div>
<?php } ?>
<!-- top END -->
</div>
<?php if ($modern_rating_cat !=1) { ?>
<div class="rating">
<?php for ($i = 1; $i <= 5; $i++) { ?>
<?php if ($product['rating'] < $i) { ?>
<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
<?php } else { ?>
<span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
<?php } ?>
<?php } ?>
</div>
<?php } ?>
<h4><a href="<?php echo $product['href']; ?>">
<?php
if( strlen($product['name'] ) < $modern_limit_symbolst){
echo $product['name'];
}else{
echo mb_substr( $product['name'],0,$modern_limit_symbolst,'utf-8' )."..."; }
?>
</a>
</h4>
<?php if ($product['price']) { ?>
<p class="price">
<?php if (!$product['special']) { ?>
<?php echo $product['price']; ?>
<?php } else { ?>
<span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
<?php } ?>
<?php if ($product['tax']) { ?>
<span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
<?php } ?>
</p>
<?php } ?>
<div class="cart">
<?php if ($product['quantity'] <= 0 && $aridiusinstock_status ) { ?>
<button type="button" class="btn-instock" onclick="instock.add('<?php echo $product['product_id']; ?>');" data-product-id="<? echo $product['product_id']; ?>"><?php echo $button_instock; ?></button>
<?php } else { ?>
<button type="button" class="btn-cartpr" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <?php echo $button_cart; ?></button>
<?php } ?>
</div>
</div>
<div class="effect-hover">
<?php if ($modern_wishlist_cat !=1 || $modern_compare_cat !=1 || $aridius_qckview_status) { ?>
<div class = "padding_mini_button">
<?php if ($modern_wishlist_cat !=1) { ?>
<a class="wishlist" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-fw fa-heart"></i></a>
<?php } ?>
<?php if ($modern_compare_cat !=1) { ?>
<a class="compare" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-fw fa-exchange"></i></a>
<?php } ?>
<?php if ($aridius_qckview_status) { ?>
<a class="quickview" data-toggle="tooltip" title="<?php echo $button_quickview; ?>" onclick="quickview_open('<?php echo $product['product_id']; ?>');"><i class="fa fa-fw fa-search"></i></a>
<?php } ?>
</div>
<?php } ?>
<?php if ($modern_description_cat !=1) { ?>
<hr>
<p class="description_cat"><?php echo $product['description']; ?></p>
<?php } ?>
<?php if($product['attribute_groups'] && $modern_atribute !=1) { ?>
<hr>
<div class="attribute_cat">
<?php foreach($product['attribute_groups'] as $attribute_group) { ?>
<?php $v = 1 ?>
<?php foreach($attribute_group['attribute'] as $key => $attribute) { ?>
<?php $v++; ?>
<?php if($v > $modern_attribute_see) break; ?>
<?php echo $attribute['name']; ?> - <?php echo $attribute['text']; ?> /
<?php } ?>
<?php } ?>
</div>
<?php } ?>
</div>
</div>
</div>
</div>
</div>
<?php } ?>
</div>
</div>
<div class="accessories-button-prev modern-button-prev"></div>
<div class="accessories-button-next modern-button-next"></div>
<script type="text/javascript">
$('.m-tabs-link').click(function () {
var category_id = $(this).attr('category_id');
$('.m-tabs-all').removeClass('active');
$('.m-tabs-link').removeClass('active');
$('.product-layoutcatnew').hide();
$(this).addClass('active');
$('#'+category_id+'.product-layoutcatnew').show();
});
$('.m-tabs-all').click(function () {
$('.product-layoutcatnew').show();
$('.m-tabs-link').removeClass('active');
$(this).addClass('active');
});
</script>
</div>
</div>
<?php } ?>
<?php echo $content_bottom; ?>
<?php if ($tags) { ?>
<p><i class="fa fa-tags" aria-hidden="true"></i> <?php echo $text_tags; ?> <?php for ($i = 0; $i < count($tags); $i++) { ?><?php if ($i < (count($tags) - 1)) { ?><a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,<?php } else { ?><a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a><?php } ?><?php } ?></p>
<?php } ?>
</div>
<?php if ($attribute_groups) { ?>
<!-- Atribute start -->
<div id="attribute_tab" class="tab-pane fade">
<div class="tab-pane">
<h3 class="title_bordered"><?php echo $attribute_tab_title; ?></h3>
<table class="table table-bordered">
<?php foreach ($attribute_groups as $attribute_group) { ?>
<thead>
<tr>
<td colspan="2"><strong><?php //echo $attribute_group['name']; ?></strong></td>
</tr>
</thead>
<tbody>
<?php foreach ($attribute_group['attribute'] as $attribute) { ?>
<tr>
<td><?php echo $attribute['name']; ?></td>
<td><?php echo $attribute['text']; ?></td>
</tr>
<?php } ?>
</tbody>
<?php } ?>
</table>
</div>
</div>
<!-- Atribute end -->
<?php } ?>
<?php if ($review_status) { ?>
<!-- Review start -->
<div id="tab-review" class="tab-pane fade">
<form class="form-horizontal" id="form-review">
<div id="review">
<?php if ($reviews_first['reviews']) {
if ( count($reviews_first['reviews']) > 5 ) {
$reviews_first_page = array_slice($reviews_first['reviews'], 0, 5);
} else { $reviews_first_page = $reviews_first['reviews']; }
?>
<?php foreach ($reviews_first_page as $review) { ?>
<table class="table table-striped table-bordered" itemprop = "review" itemscope itemtype = "http://schema.org/Review">
<tr>
<td style="width: 50%;"><strong itemprop = "author"><?php echo $review['author']; ?></strong></td>
<td class="text-right"><?php echo $review['date_added']; ?>
<time itemprop = "datePublished" datetime = "<?php echo $review['date_added']; ?>" ><?php echo $review['date_added']; ?></time>
</td>
</tr>
<tr>
<td colspan="2"><p itemprop = "reviewBody"><?php echo $review['text']; ?></p>
<div class="rating" itemprop = "reviewRating" itemscope itemtype = "http://schema.org/Rating">
<meta itemprop = "worstRating" content = "1" >
<meta itemprop = "ratingValue" content="<?php echo $review['rating']; ?>">
<meta itemprop = "bestRating" content="5">
</div>
<?php if ($review['dignity']) { ?>
<p><b><?php echo $text_dignity; ?></b> <?php echo $review['dignity']; ?></p>
<?php } ?>
<?php if ($review['limitations']) { ?>
<p><b><?php echo $text_limitations; ?></b> <?php echo $review['limitations']; ?></p>
<?php } ?>
<?php for ($i = 1; $i <= 5; $i++) { ?>
<?php if ($review['rating'] < $i) { ?>
<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
<?php } else { ?>
<span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
<?php } ?>
<?php } ?></td>
</tr>
</table>
<?php } ?>
<div class="text-right"><?php echo $reviews_first['pagination']; ?></div>
<?php } else { ?>
<p><?php echo $reviews_first['text_no_reviews']; ?></p>
<?php } ?>
</div>
<span class="text-write"><?php echo $text_write; ?></span>
<?php if ($review_guest) { ?>
<div class="form-group required">
<div class="col-sm-12">
<label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
<input type="text" name="name" value="<?php echo $customer_name; ?>" id="input-name" class="form-control" />
</div>
</div>
<div class="form-group required">
<div class="col-sm-12">
<label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
<textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
</div>
</div>
<div class="form-group">
<div class="col-sm-12">
<label for="input-dignity"><?php echo $text_dignity; ?></label>
<input type="text" name="dignity" id="input-dignity" class="form-control">
</div>
</div>
<div class="form-group">
<div class="col-sm-12">
<label for="input-limitations"><?php echo $text_limitations; ?></label>
<input type="text" name="limitations" id="input-limitations" class="form-control">
</div>
</div>
<div class="help-block"><?php echo $text_note; ?></div>
<div class="form-group required">
<div class="col-sm-12">
<label class="control-label"><?php echo $entry_rating; ?></label>
<input type="hidden" name="rating" value="5" class="rating-tooltip"/>
</div>
</div>
<?php echo $captcha; ?>
<div class="buttons clearfix">
<div class="pull-right">
<button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn-cart"><?php echo $button_continue; ?></button>
</div>
</div>
<?php } else { ?>
<?php echo $text_login; ?>
<?php } ?>
</form>
</div>
<!-- Review end -->
<?php } ?>
<!-- Аccessories start -->
<div id="tab-accessories" class="tab-pane fade">
<?php if ($products && !$modern_product_recom) { ?>
<script>
$(document).ready(function(){var a=new Swiper("#accessories_carusel_cont.swiper-container",{init:!1,slidesPerView:4,watchSlidesVisibility:!0,watchSlidesProgress:!0,loop:!1,preloadImages:!0,updateOnImagesReady:!0,grabCursor:!0,autoHeight:!0,touchMoveStopPropagation:!0,autoplayDisableOnInteraction:!0,slideVisibleClass:"swiper-slide-visible",navigation:{nextEl:".accessories-button-next",prevEl:".accessories-button-prev"},breakpoints:{1599:{slidesPerView:4},1199:{slidesPerView:3},768:{slidesPerView:2},479:{slidesPerView:1}},on:{imagesReady:function(){$("#accessories_carusel").css("height",this.height+"px");var a=$(".accessories-imgsize").height()/2;$("#accessories_carusel .button_swiper_car").css("top",a+15+"px"),$("#accessories_carusel .swiper-lazy-preloader").css("top",a+"px")},resize:function(){$("#accessories_carusel").css("height",this.height+"px");var a=$(".accessories-imgsize").height()/2;$("#accessories_carusel .button_swiper_car").css("top",a+15+"px"),$("#accessories_carusel .swiper-lazy-preloader").css("top",a+"px")}}});$("#tab-accessories_active").on("shown.bs.tab",function(){a.init()})});
</script>
<h3 class="title_h title_center"><?php echo $text_related; ?></h3>
<div class="padding-carusel row" id="accessories_carusel">
<div id="accessories_carusel_cont" class="swiper-container padding_swiper button-next-prev">
<div class="swiper-wrapper">
<?php foreach ($products as $key => $product) { ?>
<div class="product-layoutcatnew swiper-slide">
<?php if (!$modern_arrows) { ?>
<div class="swiper-button-prev<?php echo $key ?> button_prev button_swiper_car">
<i class="fa fa-arrow-left"></i>
</div>
<div class="swiper-button-next<?php echo $key ?> button_next button_swiper_car" >
<i class="fa fa-arrow-right"></i>
</div>
<?php } ?>
<div class="product-layout2">
<div class="border product-thumb">
<div class="caption">
<div id="imgCarousel-accessories<?php echo $key ?>">
<div class="accessories_block swiper-container">
<?php if (!$modern_other1) { ?><button class="button_img_quick" data-toggle="tooltip" title="<?php echo $button_quickview; ?>" onclick="quickview_open('<?php echo $product['product_id']; ?>');"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x"></i><i class="fa fa-search fa-stack-1x fa-inverse"></i></span></button><?php } ?>
<div class="swiper-wrapper">
<div class="item swiper-slide">
<a href="<?php echo $product['href']; ?>"><img class="accessories-imgsize img-responsive center-add_img" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
</div>
<?php foreach ($product['images'] as $key3 => $image) { ?>
<div class="item swiper-slide addit_lazy">
<a href="<?php echo $product['href']; ?>"><img class="swiper-lazy img-responsive center-add_img" src="catalog/view/theme/modern/image/background_white.jpg" alt="<?php echo $product['name']; ?>-foto<?php echo $key3+2 ?>" data-src="<?php echo $image['thumb']; ?>"/></a>
<div class="swiper-lazy-preloader"></div>
</div>
<?php } ?>
</div>
</div>
<script>
$(document).ready(function () { var accessoriesSwiper<?php echo $key ?> = new Swiper('#imgCarousel-accessories<?php echo $key ?> .swiper-container', { observer:true, observeParents:true, simulateTouch:false, preloadImages: false, autoHeight:false, loop: false, lazy: true, navigation: { nextEl: '#accessories_carusel .swiper-button-next<?php echo $key ?>', prevEl: '#accessories_carusel .swiper-button-prev<?php echo $key ?>' }, }) });
</script>
<div class="positionsticker">
<!-- special -->
<?php if ($modern_sticker_sale_product_auto !=1 && $product['special'] && $product['price_sticker'] != 0) { ?>
<?php  $percent = round(100 - ($product['special_sticker'] / $product['price_sticker']) * 100); ?>
<div class="stickers-special">-<?php echo $percent; ?>%</div>
<?php } ?>
<!-- special END -->
<!-- new -->
<?php
$startDate1 = strtotime(mb_substr($product['dateadded'], 0, 10));
$endDate2 = strtotime(date("Y-m-d"));
$days = ceil(($endDate2 / 86400)) - ceil(($startDate1 / 86400));
?>
<?php if($modern_sticker_new_product_auto !=1 && $days < $modern_sticker_product_new_day || $modern_sticker_new_product_auto !=0 && $product['stickers'] == 1) { ?>
<div class="stickers-new"><?php echo $modern_name_sticker_product_new[$language_id]; ?></div>
<?php } ?>
<!-- new END -->
<!-- top -->
<?php if ($modern_sticker_top_product_auto !=1 && $modern_sticker_product_top_ratinr == 1 && $product['rating'] == $modern_sticker_product_top_rating || $modern_sticker_top_product_auto !=1 && $modern_sticker_product_top_ratinr == 2 || $modern_sticker_top_product_auto !=0 && $product['stickers'] == 2 ) { ?>
<div class="stickers-top"><?php echo $modern_name_sticker_product_top[$language_id]; ?></div>
<?php } ?>
<!-- top END -->
</div>
<?php if ($modern_rating_cat !=1) { ?>
<div class="rating">
<?php for ($i = 1; $i <= 5; $i++) { ?>
<?php if ($product['rating'] < $i) { ?>
<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
<?php } else { ?>
<span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
<?php } ?>
<?php } ?>
</div>
<?php } ?>
<h4><a href="<?php echo $product['href']; ?>">
<?php
if( strlen($product['name'] ) < $modern_limit_symbolst) {
echo $product['name'];
}
else {
echo mb_substr( $product['name'],0,$modern_limit_symbolst,'utf-8' )."..."; }
?>
</a>
</h4>
<?php if ($product['price']) { ?>
<p class="price">
<?php if (!$product['special']) { ?>
<?php echo $product['price']; ?>
<?php } else { ?>
<span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
<?php } ?>
<?php if ($product['tax']) { ?>
<span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
<?php } ?>
</p>
<?php } ?>
<div class="cart">
<?php if ($product['quantity'] <= 0 && $aridiusinstock_status ) { ?>
<button type="button" class="btn-instock" onclick="instock.add('<?php echo $product['product_id']; ?>');" data-product-id="<? echo $product['product_id']; ?>"><?php echo $button_instock; ?></button>
<?php } else { ?>
<button type="button" class="btn-cartpr" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <?php echo $button_cart; ?></button>
<?php } ?>
</div>
</div>
<div class="effect-hover">
<?php if ($modern_wishlist_cat !=1 || $modern_compare_cat !=1 || $aridius_qckview_status&& !$modern_other1) { ?>
<div class = "padding_mini_button">
<?php if ($modern_wishlist_cat !=1) { ?>
<a class="wishlist" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-fw fa-heart"></i></a>
<?php } ?>
<?php if ($modern_compare_cat !=1) { ?>
<a class="compare" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-fw fa-exchange"></i></a>
<?php } ?>
<?php if ($aridius_qckview_status && !$modern_other1) { ?>
<a class="quickview" data-toggle="tooltip" title="<?php echo $button_quickview; ?>" onclick="quickview_open('<?php echo $product['product_id']; ?>');"><i class="fa fa-fw fa-search"></i></a>
<?php } ?>
</div>
<?php } ?>
<?php if ($modern_description_cat !=1) { ?>
<hr>
<p class="description_cat"><?php echo $product['description']; ?></p>
<?php } ?>
<?php if($product['attribute_groups'] && $modern_atribute !=1) { ?>
<hr>
<div class="attribute_cat">
<?php foreach($product['attribute_groups'] as $attribute_group) { ?>
<?php $v = 1 ?>
<?php foreach($attribute_group['attribute'] as $key => $attribute) { ?>
<?php $v++; ?>
<?php if($v > $modern_attribute_see) break; ?>
<?php echo $attribute['name']; ?> - <?php echo $attribute['text']; ?> /
<?php } ?>
<?php } ?>
</div>
<?php } ?>
</div>
</div>
</div>
</div>
</div>
<?php } ?>
</div>
</div>
<div class="accessories-button-prev modern-button-prev"></div>
<div class="accessories-button-next modern-button-next"></div>
</div>
<?php } ?>
</div>
<!-- Аccessories end -->
<?php foreach($product_tabs as $key => $tab){ ?>
<div class="tab-pane" id="tab-<?php echo $product_id ?>-<?php echo $tab['product_tab_id']; ?>"><?php echo $tab['description']; ?></div>
<?php } ?>
<!-- Other start -->
<?php if ($modern_top_links7 ) { ?>
<?php foreach ($modern_top_links7 as $key => $modern_top_link7) { ?>
<?php if ($modern_top_link7['title'][$language_id]) { ?><div class="tab-pane" id="other_tab-<?php echo $key ?>"><?php echo html_entity_decode($modern_top_link7['description'][$language_id]); ?></div> <?php } ?>
<?php } ?>
<?php } ?>
<!-- Other end -->
</div>
</div>
</div>
</div>
</div>
<?php echo $column_right; ?>
</div>
<?php if ($aridius_popupsize_status && $popupsize == 1) { ?>
<div id="popup-modal" class="white-popup-block mfp-hide">
<div class="popupsize">
<div class="popupsizebor">
<button title="close" type="button" class="mfp-close">&#215;</button>
<div class="name-popup"><?php echo $aridius_popupsize_name[$language_id]; ?></div>
</div>
<br />
<div class="popupsize2">
<ul class="nav nav-tabs pup mod">
<?php if ($aridius_popupsize_top_links ) { ?>
<?php foreach ($aridius_popupsize_top_links as $key => $aridius_popupsize_top_link) { ?>
<?php if ($aridius_popupsize_top_link['title'][$language_id]) { ?>
<li><a href="#tab-<?php echo $key ?>" data-toggle="tab"><?php echo $aridius_popupsize_top_link['title'][$language_id]; ?></a></li>
<?php } ?>
<?php } ?>
<?php } ?>
</ul>
<div class="tab-content">
<?php if ($aridius_popupsize_top_links ) { ?>
<?php foreach ($aridius_popupsize_top_links as $key => $aridius_popupsize_top_link) { ?>
<?php if ($aridius_popupsize_top_link['title'][$language_id]) { ?>
<div class="tab-pane pup" id="tab-<?php echo $key ?>"><?php echo html_entity_decode($aridius_popupsize_top_link['description'][$language_id]); ?></div>
<?php } ?>
<?php } ?>
<?php } ?>
</div>
</div>
</div>
</div>
<script>
$('.date').datetimepicker({
	language: '<?php echo $datepicker ?>',
	pickTime: false
});
$('.datetime').datetimepicker({
	language: '<?php echo $datepicker ?>',
	pickDate: true,
	pickTime: true
});
$('.time').datetimepicker({
	language: '<?php echo $datepicker ?>',
	pickDate: false
});
</script>
<!--popup-module-->
<script>
$(".popup-modal").magnificPopup({preloader:!0,callbacks:{open:function(){$(".mfp-content").addClass("popupsize_mfp"),$(".nav-tabs.pup li:first").addClass("active"),$(".tab-pane.pup:first").addClass("active")},close:function(){$(".nav-tabs.pup li").removeClass("active"),$(".tab-pane.pup").removeClass("active")}}});
</script>
<?php } ?>
<!--rating_stars-->
<script>
$(function(){$(".rating-tooltip").ar_rating({extendSymbol:function(a){$(this).tooltip({container:"body",placement:"bottom",title:a})}})});
</script>
<!--timer-->
<?php if (($special && $special_date_end > $special_date_start)&&($modern_product_timer !=1)) {$date_out = date('Y, m, d', strtotime($special_date_end)); ?>
<script>
function get_timer() { var timeend= new Date(); timeend = new Date(<?php echo $date_out; ?>); var day = new Date(); day.setMonth(day.getMonth() + 1); day = Math.floor((timeend-day)/1000); var sec=day%60; day=Math.floor(day/60); var min=day%60; day=Math.floor(day/60); var hour=day%24; day=Math.floor(day/24); if(day<10)day='0'+day; if(hour<10)hour='0'+hour; if(min<10)min='0'+min; if(sec<10)sec='0'+sec; var timestr =  "<span class='special-timer-info'>" +day+  "<span class='special-timer-text'><?php echo $day; ?></span></span><span class='special-timer-line'>:</span><span class='special-timer-info'>"  +hour+    "<span class='special-timer-text'><p><?php echo $hour; ?></p></span></span><span class='special-timer-line'>:</span><span class='special-timer-info'>"  +min+   "<span class='special-timer-text'><?php echo $minute; ?></span></span><span class='special-timer-line'>:</span><span class='special-timer-info'>"   +sec+   "<span class='special-timer-text'><?php echo $second; ?></span></span>"; document.getElementById('time_out_pr').innerHTML=timestr; setTimeout(get_timer,1000); } get_timer();
</script>
<?php } ?>
<script>
$("select[name='recurring_id'], input[name=\"quantity\"]").change(function(){$.ajax({url:"index.php?route=product/product/getRecurringDescription",type:"post",data:$("input[name='product_id'], input[name='quantity'], select[name='recurring_id']"),dataType:"json",beforeSend:function(){$("#recurring-description").html("")},success:function(a){$(".alert, .text-danger").remove(),a.success&&$("#recurring-description").html(a.success)}})});
</script>
<!--button-cart-->
<script>
$("body").on("click","#button-cart",function(){$.magnificPopup.close(),setTimeout(function(){$.ajax({url:"index.php?route=checkout/cart/add",type:"post",data:$("#product input[type='text'], #product input[type='hidden'], #product input[type='radio']:checked, #product input[type='checkbox']:checked, #product select, #product textarea"),dataType:"json",beforeSend:function(){$("#button-cart").button("loading")},complete:function(){$("#button-cart").button("reset")},success:function(a){if($(".alert, .text-danger").remove(),$(".form-group").removeClass("has-error"),a.error){if(a.error.option)for(i in a.error.option){var b=$("#input-option"+i.replace("_","-"));b.parent().hasClass("input-group")?b.parent().after('<div class="text-danger">'+a.error.option[i]+"</div>"):b.after('<div class="text-danger">'+a.error.option[i]+"</div>")}a.error.recurring&&$("select[name='recurring_id']").after('<div class="text-danger">'+a.error.recurring+"</div>"),$(".text-danger").parent().addClass("has-error")}a.success&&($.magnificPopup.open({removalDelay:500,fixedContentPos:!0,items:{src:"index.php?route=common/aridius_cart/info"},type:"ajax",mainClass:"mfp-fade"}),$("#cart button > span").html("<span> &nbsp;"+a.total+'&nbsp;<span class="caret"></span></span>'),$("#cart > ul").load("index.php?route=common/cart/info ul li"))},error:function(a,b,c){alert(c+"\r\n"+a.statusText+"\r\n"+a.responseText)}})},300)});
</script>
<!--review-->
<script ><!--
$('#review').delegate('.pagination a', 'click', function(e) { e.preventDefault(); $('#review').fadeOut('slow'); $('#review').load(this.href); $('#review').fadeIn('slow'); }); $('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?> .table-striped', function() { var len = $(".table-striped").length; var random = Math.floor(Math.random() * len) + 1; var random_next = random + 1; var random_prev = random - 1;  <?php if ($attribute_groups) { ?> $('#aridius_review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?> .table-review' + random); <?php } else { ?> if (len < 2) { $('#aridius_review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?> .table-review' + random); } else if (len > 1 && random == 1) { $('#aridius_review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?> .table-review' + random ); $('#aridius_review2').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?> .table-review' + random_next); } else if (len > 1 && random > 1) { $('#aridius_review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?> .table-review' + random ); $('#aridius_review2').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?> .table-review' + random_prev); } <?php } ?> });
$("#button-review").on("click",function(){$.ajax({url:"index.php?route=product/product/write&product_id=<?php echo $product_id; ?>",type:"post",dataType:"json",data:$("#form-review").serialize(),beforeSend:function(){$("#button-review").button("loading")},complete:function(){$("#button-review").button("reset")},success:function(a){$(".alert-success, .alert-danger").remove(),a.error&&$("#review").after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> '+a.error+"</div>"),a.success&&($("#review").after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> '+a.success+"</div>"),$("input[name='name']").val(""),$("input[name='dignity']").val(""),$("input[name='limitations']").val(""),$("textarea[name='text']").val(""),$("input[name='rating']:checked").prop("checked",!1))}}),grecaptcha.reset()});
</script>
<!--review stars -->
<script>
$(".review_profile").click(function(){var a=$(".nav-tabs").offset().top;$("html, body").animate({scrollTop:a},800)});
</script>
<script >
$(".specification_profile").click(function(){var a=$(".nav-tabs").offset().top;$("html, body").animate({scrollTop:a},800)});
</script>
<!-- + / - -->
<script>
function minus(){return document.getElementById("input-quantity").value<=1?!1:void document.getElementById("input-quantity").value--}function plus(){document.getElementById("input-quantity").value++}$("#minus").click(function(){minus()}),$("#plus").click(function(){plus()});
</script>
<!--related products -->
<script>
$(function(){$(".fixzoom li.active .fa-caret-down").removeClass("hidden"),$('a[data-toggle="tab"]').on("show.bs.tab",function(){$(this).find(".fa-caret-down").removeClass("hidden")}),
$('.fixzoom a[href="#tab-product"]').on("shown.bs.tab",function(){
<?php if ($modern_product_raiting != '0' || $modern_product_raiting) { ?>
$(".zoomContainer").css("z-index","1")}),
<?php } ?>
$('.fixzoom a[data-toggle="tab"]').on("hide.bs.tab",function(){$(this).find(".fa-caret-down").addClass("hidden"),$(".zoomContainer").css("z-index","-1")})});
</script>
<script >
$(document).ready(function(){var a=window.location.hash;if(a){var b=a.split("#"),c=b[1].split("-");for(i=0;i<c.length;i++)$("div.options").find('select option[value="'+c[i]+'"]').attr("selected",!0).trigger("select"),$("div.options").find('input[type="radio"][value="'+c[i]+'"]').attr("checked",!0).trigger("click")};$('.spoiler').on('click', function(e){e.preventDefault();var spoiler = $('.spoiler-more').val(),spoiler_value = $('.spoiler-value').val(),prev = $(this).prev();prev.toggleClass('open');if (prev.hasClass('open')){$(this).html(spoiler_value)}else{$(this).html(spoiler);$('html,body').animate({ scrollTop: $('.description_product').offset().top - 150 }, 1000);}return false;});$('a[data-toggle="tab"]').on('shown.bs.tab', function(e){var tab = $(this).attr('href');$('html,body').animate({ scrollTop: $(tab).offset().top - 100 }, 1000);})});
</script>
<!--swiper foto -->
<?php if (!$modern_product_position_img && $images) { ?>
<script>
window.onload=function(){var b=($(".mini_foto2").length,new Swiper("#image-additional2.swiper-container",{direction:"vertical",mousewheel:!0,watchSlidesVisibility:!0,loop:!1,grabCursor:!0,mousewheel:{forceToAxis:!0,invert:!0,sensitivity:1},navigation:{nextEl:".addit-button-next",prevEl:".addit-button-prev"}}));$(window).resize(function(){var c=$("#block_foto").height();$("#image-addit").css("height",c+"px"),c-=30;var d=$("#mini_foto").height()+20,f=Math.floor(c/d);b.params.slidesPerView=f,b.params.slidesPerGroup=$(window).width()>991?f:1,b.update(),$("#image-addit").css("opacity","1")}),$(window).resize()};
</script>
<script>
if($(window).width()>991){$("body").css("overflow","");var scrollard;$("#image-addit").on("mouseenter",function(){return scrollard=$(window).scrollTop(),$("body").css("top",-scrollard+"px"),$("body").addClass("noscroll"),scrollard}),$("#image-addit").on("mouseleave",function(){$("body").removeClass("noscroll"),$(window).scrollTop(scrollard)})}else $("body").removeClass("noscroll"),$("#image-addit").on("touchstart",function(){$("body").css("overflow","hidden")}),$("#image-addit").on("touchend touchcancel touchleave tap",function(){$("body").css("overflow","")});
</script>
<?php } elseif ($modern_product_position_img && $images) { ?>
<script>
var additSwiper=new Swiper("#image-additional2.swiper-container",{slidesPerView:5,loop:!1,grabCursor:!0,navigation:{nextEl:".addit-button-hor-next",prevEl:".addit-button-hor-prev"},breakpoints:{1599:{slidesPerView:4},1199:{slidesPerView:3},991:{slidesPerView:5},768:{slidesPerView:3},479:{slidesPerView:2}}});
</script>
<?php } ?>
</script>
<!-- PhotoSwipe - START -->
<link rel="stylesheet" href="catalog/view/theme/modern/js/photoswipe/photoswipe.css">
<link rel="stylesheet" href="catalog/view/theme/modern/js/photoswipe/default-skin/default-skin.css">
<script src="catalog/view/theme/modern/js/photoswipe/photoswipe.min.js"></script>
<script src="catalog/view/theme/modern/js/photoswipe/photoswipe-ui-default.min.js"></script>
    <div id="gallery" class="pswp" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="pswp__bg"></div>
        <div class="pswp__scroll-wrap">
          <div class="pswp__container">
			<div class="pswp__item"></div>
			<div class="pswp__item"></div>
			<div class="pswp__item"></div>
          </div>
          <div class="pswp__ui pswp__ui--hidden">
            <div class="pswp__top-bar">
				<div class="pswp__counter"></div>
				<button class="pswp__button pswp__button--close" title="Close (Esc)"></button>
				<button class="pswp__button pswp__button--share" title="Share"></button>
				<button class="pswp__button pswp__button--fs" title="Toggle fullscreen"></button>
				<button class="pswp__button pswp__button--zoom" title="Zoom in/out"></button>
				<div class="pswp__preloader">
					<div class="pswp__preloader__icn">
					  <div class="pswp__preloader__cut">
					    <div class="pswp__preloader__donut"></div>
					  </div>
					</div>
				</div>
            </div>
			<!-- <div class="pswp__loading-indicator"><div class="pswp__loading-indicator__line"></div></div> -->
            <div class="pswp__share-modal pswp__share-modal--hidden pswp__single-tap">
	            <div class="pswp__share-tooltip">
					<!-- <a href="#" class="pswp__share--facebook"></a>
					<a href="#" class="pswp__share--twitter"></a>
					<a href="#" class="pswp__share--pinterest"></a>
					<a href="#" download class="pswp__share--download"></a> -->
	            </div>
	        </div>
            <button class="pswp__button pswp__button--arrow--left" title="Previous (arrow left)"></button>
            <button class="pswp__button pswp__button--arrow--right" title="Next (arrow right)"></button>
            <div class="pswp__caption">
              <div class="pswp__caption__center">
              </div>
            </div>
          </div>
        </div>
		<div class="cart_popup_img">
		<div class="image_titlepopup2"><?php echo $heading_title; ?></div>
		</div>
    </div>
	<script type="text/javascript">
        function showPSWP () {
            var pswpElement = document.querySelectorAll('.pswp')[0];
            var items = [
                <?php
                    if ($thumb || $images) {
                        echo'{thumb: "'.$thumb.'", src: "'.$popup.'", w: "'.$modern_image_popup_width.'", h: "'.$modern_image_popup_height.'"},';
                        foreach ($images as $v) {
                            echo'{thumb: "'.$v['thumb2'].'", src: "'.$v['popup'].'", w: "'.$modern_image_popup_width.'", h: "'.$modern_image_popup_height.'"},';
                        }
                    }
                ?>
            ];
            var options = {
				index: 0,
				closeOnScroll: false,
				bgOpacity:0.7,
				mouseUsed:true
				};
            var selected_src = 0;
            $.each(items, function (k,v) {
                if ($("#main-image").prop("src") == v['thumb']) {
                    selected_src = 1;
                };
            });
			//console.log(items);
            if (selected_src == 0) {
                items.push({
                    thumb: $("#main-image").prop("src"),
                    src: $("#main-image").prop("src"),
                    w: <?php echo $modern_image_popup_width; ?>,
                    h: <?php echo $modern_image_popup_height; ?>
                });
            };
			//console.log(items);
            $.each(items, function (k,v) {
                if ($("#main-image").prop("src") == v['thumb']) {
                    options.index = k;
                };
            });
            var gallery = new PhotoSwipe( pswpElement, PhotoSwipeUI_Default, items, options);
			gallery.listen('afterInit', function(index, item) {
					sessionStorage.setItem('gallery_product', '1');
				});
					gallery.listen('destroy', function(index, item) {
					sessionStorage.setItem('gallery_product', '0');
				});
            gallery.init();
        $(".close_phswipe").on("click", function(){
        gallery.close();
        });
        };
        $("#main-image").on("click", function(){ showPSWP(); });
		$(".cart_popup_img").append("<div class='cartpop hidden-xs'><?php if (!$special) { ?><span class='priceproduct-newpopup'><?php echo $price; ?></span><?php } else { ?><span class='priceproduct-newpopup'><?php echo $special; ?></span>&nbsp;&nbsp;<span class='priceproduct-oldpopup'><?php echo $price; ?></span><?php } ?> <?php if ($quantity <= 0 && $aridiusinstock_status ) { ?><button type='button' class='close_phswipe btn-instock' onclick=\"instock.add('<?php echo $product_id; ?>');\" data-product-id='<?php echo $product_id; ?>'><?php echo $button_instock; ?></button><?php } else { ?><button type='button' id='button-cart' data-loading-text='<?php echo $text_loading; ?>' class='close_phswipe btn-cart'><i class='fa fa-shopping-cart'></i> <?php echo $button_cart; ?></button><?php } ?></div>");
    </script>
<!-- PhotoSwipe - END -->

<!-- elevateZoom/pop up img -->
<script src="catalog/view/theme/modern/js/elevatezoom/jquery.elevateZoom-3.0.8.min.js"></script>
<script><!--
jQuery(document).ready(function () {
	$('.imgpopcat').click( "click" , function(event){
	var img = $(this).attr('data-image');
	var title = $(this).attr('title');
	var imgphoto = $(this).data('zoomImage');
	$('#main-image').attr("src" , img);
	$('#main-image').data('zoomImage', imgphoto);

<?php if ($modern_product_raiting == '0' || !$modern_product_raiting) { ?>
	$('.zoomWindow').css('background-image', 'url('+imgphoto+')');
<?php } elseif ($modern_product_raiting == '1') { ?>
	$('.zoomWindow').css('background-image', 'url('+imgphoto+')');//Basic Zoom
<?php } elseif ($modern_product_raiting == '2') { ?>
		$('.zoomWindow').css('background-image', 'url('+imgphoto+')');//Inner Zoom
<?php } elseif ($modern_product_raiting == '3') { ?>
		$('.zoomLens').css('background-image', 'url('+imgphoto+')');//Lens Zoom
<?php } elseif ($modern_product_raiting == '4') { ?>
		$('.zoomLens').css('background-image', 'url('+imgphoto+')');//Image Constrain Image
<?php } ?>
});
	$('#image-additional2 a').on('click', function (e) {
		e.preventDefault();
			var imagePath = $(this).data('zoomImage');
			$('#main-image').data('zoomImage', imagePath);
	});
});
<?php if ($modern_product_raiting == '0' || !$modern_product_raiting) { ?>
	$("#main-image").elevateZoom({gallery:'image-additional2',  cursor: "crosshair" , galleryActiveClass: 'active',zoomEnabled:false });
<?php } elseif ($modern_product_raiting == '1') { ?>
	$("#main-image").elevateZoom({gallery:'image-additional2',  cursor: "crosshair" , galleryActiveClass: 'active' });
<?php } elseif ($modern_product_raiting == '2') { ?>
	$("#main-image").elevateZoom({gallery:'image-additional2', zoomType :"inner",  cursor:"crosshair", galleryActiveClass: 'active' });
<?php } elseif ($modern_product_raiting == '3') { ?>
	$("#main-image").elevateZoom({gallery:'image-additional2', zoomType: "lens", lensShape: "round", lensSize: 200, galleryActiveClass: 'active'});
<?php } elseif ($modern_product_raiting == '4') { ?>
	$("#main-image").elevateZoom({gallery:'image-additional2', constrainSize:200, zoomType: "lens", containLensZoom: true, cursor: 'pointer', galleryActiveClass: "active"});
<?php } ?>

 $(window).resize(function(e){
        $('.zoomContainer').remove();
   <?php if ($modern_product_raiting == '0' || !$modern_product_raiting) { ?>
	$("#main-image").elevateZoom({gallery:'image-additional2',  cursor: "crosshair" , galleryActiveClass: 'active',zoomEnabled:false });
<?php } elseif ($modern_product_raiting == '1') { ?>
	$("#main-image").elevateZoom({gallery:'image-additional2',  cursor: "crosshair" , galleryActiveClass: 'active' });
<?php } elseif ($modern_product_raiting == '2') { ?>
	$("#main-image").elevateZoom({gallery:'image-additional2', zoomType :"inner",  cursor:"crosshair", galleryActiveClass: 'active' });
<?php } elseif ($modern_product_raiting == '3') { ?>
	$("#main-image").elevateZoom({gallery:'image-additional2', zoomType: "lens", lensShape: "round", lensSize: 200, galleryActiveClass: 'active'});
<?php } elseif ($modern_product_raiting == '4') { ?>
	$("#main-image").elevateZoom({gallery:'image-additional2', constrainSize:200, zoomType: "lens", containLensZoom: true, cursor: 'pointer', galleryActiveClass: "active"});
<?php } ?>
});

$("#main-image").on("click", function(e) {
	var ez = $('#main-image').data('elevateZoom');
	return false;
});
//--></script>
<?php echo $footer; ?>