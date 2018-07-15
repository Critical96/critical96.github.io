<link href="catalog/view/theme/unishop/stylesheet/quick_order.css" property="stylesheet" rel="stylesheet" type="text/css" media="screen" /> 
<div id="modal-quick-order" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title"><?php echo $name; ?></h4>
			</div>
			<div id="quick_order" class="modal-body">
				<div id="product">
					<div class="row">
						<div class="image col-xs-12 col-sm-4 col-md-5">
							<?php foreach($uni_stickers as $uni_sticker) { ?><div class="product_sticker <?php echo $uni_sticker['name']; ?>"><?php echo $uni_sticker['text']; ?> <?php echo $uni_sticker['value']; ?> <?php echo $uni_sticker['text_after']; ?></div><?php } ?>
							<?php if ($thumb) { ?><img src="<?php echo $thumb; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /><?php } ?>
							<?php if($images) { ?>
								<div class="image-additional">
									<div class="col-xs-3 col-sm-4"><img src="<?php echo $small; ?>" data-image="<?php echo $thumb; ?>" alt="" class="img-responsive" /></div>
									<?php foreach($images as $image) { ?>
										<div class="col-xs-3 col-sm-4"><img src="<?php echo $image['small']; ?>" data-image="<?php echo $image['thumb']; ?>" alt="" class="img-responsive" /></div>
									<?php } ?>
								</div>
							<?php } ?>
						</div>
						<div class="name col-xs-12 col-sm-8 col-md-7">
							<hr class="visible-xs" />
							<div class="row">
								<?php if ($manufacturer) { ?><div class="col-sm-6 col-md-6"><?php echo $text_manufacturer; ?> <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a></div><?php } ?>
								<div class="col-sm-6 col-md-6"><?php echo $text_model; ?> <?php echo $model; ?></div>
								<?php if ($reward) { ?><div class="col-sm-6 col-md-6"><?php echo $text_reward; ?> <?php echo $reward; ?></div><?php } ?>
								<div class="col-sm-6 col-md-6"><?php echo $text_stock; ?> <span class="custom-stock"> <?php echo $stock; ?> </span>
								<?php if ($quantity <= 0) { ?>
                <span class="label label-warning"><?php echo $quantity; ?></span>
                <?php } elseif ($quantity <= 5) { ?>
                <span class="label label-danger"><?php echo $quantity; ?></span>
                <?php } else { ?>
                <span class="label label-success"><?php echo $quantity; ?></span>
                <?php } ?>	
								</div>
								<?php if ($points) { ?><div class="col-sm-6 col-md-6"><?php echo $text_points; ?> <?php echo $points; ?></div><?php } ?>
							</div>
							<div class="price">
								<?php if (!$special) { ?>
									<h2 class="autocalc-product-price"><?php echo $price; ?></h2>
								<?php } else { ?>
									<span class="old_price"><?php echo $price; ?></span> <h2 class="autocalc-product-price"><?php echo $special; ?></h2>
								<?php } ?>
							</div>
							<?php if ($minimum > 1) { ?>
								<div class="alert alert-info minimum"><i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?></div>
							<?php } ?>
						</div>
					</div>
					<!-- <?php if ($show_attr && $attribute_groups) { ?>
						<h5 class="heading"><span><?php echo $lang['text_attributes']; ?></span></h5>
						<div class="row">
							<?php foreach ($attribute_groups as $key => $attribute_group) { ?>
								<?php if ($key < $show_attr_group) { ?>
									<div class="attributes col-xs-12 col-sm-6">
										<div class="attribute">
											<?php foreach ($attribute_group['attribute'] as $key => $attribute) { ?>
												<?php if ($key < $show_attr_item) { ?>
													<div>
														<span><span><?php echo $attribute['name']; ?></span></span>
														<span><span><?php echo $attribute['text']; ?></span></span>
													</div>
												<?php } ?>
											<?php } ?>
										</div>
									</div>
								<?php } ?>
							<?php } ?>
						</div>
					<?php } ?> -->
					<?php if ($description_on) { ?>
						<h5 class="heading"><span><?php echo $lang['text_description']; ?></span></h5>
						<div class="row" style="margin-bottom:15px;">
							<div class="col-xs-12"><?php echo $description; ?> <a href="<?php echo $href; ?>" title=""><?php echo $lang['text_more']; ?></a></div>
						</div>
					<?php } ?>
					<div class="row">
						<div class="options option col-xs-12">
							<?php if ($options) { ?>
								<h5 class="heading"><span><?php echo $text_option; ?></span></h5>
								<?php foreach ($options as $option) { ?>
									<?php if ($option['type'] == 'select') { ?>
										<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
											<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
											<select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
												<option value=""><?php echo $text_select; ?></option>
												<?php foreach ($option['product_option_value'] as $option_value) { ?>
													<option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?> <?php if ($option_value['price']) { ?>(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)<?php } ?>
														
													</option>
												<?php } ?>
											</select>
										</div>
									<?php } ?>
									<?php if ($option['type'] == 'radio' || $option['type'] == 'image') { ?>
										<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
											<label class="control-label"><?php echo $option['name']; ?></label>
											<div id="input-option<?php echo $option['product_option_id']; ?>">
												<?php foreach ($option['product_option_value'] as $option_value) { ?>
													<div class="radio">
														<label class="input1">
															<input type="radio" class="quick-page-option" name="q_option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="q_<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>" />
															<?php if ($option_value['image']) { ?>
																<span class="img" title="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" data-toggle="tooltip" data-thumb="<?php echo $option_value['small']; ?>">
																	<img src="<?php echo $option_value['image']; ?>" data-toggle="tooltip" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" />
																</span>
															<?php } else { ?>
																<span><?php echo $option_value['name']; ?><?php if ($option_value['price']) { ?><span class="option-price_c">(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)</span><?php } ?>
																<span class="option-quantity-custom1"><?php echo $option_value['quantity']; ?><span> шт.</span></span>
															</span>
															<?php } ?>
														</label>
													</div>
												<?php } ?>
											</div>
										</div>
									<?php } ?>
									<?php if ($option['type'] == 'checkbox') { ?>
										<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
											<label class="control-label"><?php echo $option['name']; ?></label>
											<div id="input-option<?php echo $option['product_option_id']; ?>">
												<?php foreach ($option['product_option_value'] as $option_value) { ?>
													<div class="checkbox radio">
														<label class="input1">
															<input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="<?php echo $option['product_option_id']; ?>_<?php echo $option_value['product_option_value_id']; ?>" />
															<span><?php echo $option_value['name']; ?><?php if ($option_value['price']) { ?><span>(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)</span><?php } ?></span>
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
												<span class="input-group-btn"><button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button></span>
											</div>
										</div>
									<?php } ?>
									<?php if ($option['type'] == 'datetime') { ?>
										<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
											<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
											<div class="input-group datetime">
												<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
												<span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span>
											</div>
										</div>
									<?php } ?>
									<?php if ($option['type'] == 'time') { ?>
										<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
											<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
											<div class="input-group time">
												<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
												<span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span>
											</div>
										</div>
									<?php } ?>
								<?php } ?>
							<?php } ?>
						</div>
					</div>
					<h5 class="heading"><span><?php echo $lang['text_contact_data']; ?></span></h5>
					<div class="row_input row">
						<form>
							<div class="col-sm-6 col-md-6"><input type="text" name="customer_name" class="customer_name form-control" placeholder="<?php echo $name_text; ?>*" value="<?php echo $firstname; ?>" /></div>
							<div class="col-sm-6 col-md-6"><input type="text" name="customer_phone" class="customer_phone form-control " placeholder="<?php echo $phone_text; ?>*" value="<?php echo $telephone; ?>" /></div>
							<?php if($mail) { ?><div class="col-sm-6 col-md-6"><input type="text" name="customer_mail" class="form-control" placeholder="<?php echo $mail_text; ?>" value="<?php echo $email; ?>" /></div><?php } ?>
							<?php if($delivery) { ?><div class="col-sm-6 col-md-6"><input type="text" name="customer_delivery" class="form-control" placeholder="<?php echo $delivery_text; ?>" value="<?php echo $address; ?>" /></div><?php } ?>
							<?php if($comment) { ?><div class="<?php if($delivery) { ?>col-xs-12<?php } else { ?>col-sm-6 col-md-6<?php } ?>"><input type="text" name="customer_comment" class="form-control" placeholder="<?php echo $comment_text; ?>" /></div><?php } ?>
						</form>
					</div>
					<hr style="margin-top:0" />
					<div class="row">
						<div class="col-xs-12" style="text-align:center">
							<!-- <?php if ($text_agree) { ?>
								<div class="radio" style="float:none; margin:0 0 10px">
									<label class="input"><input id="confirm" type="checkbox" name="confirm" value="1" /><span></span><?php echo $text_agree; ?></label>
								</div>
							<?php } ?> -->
							<div class="add_quick_order quantity form-group">
								<label class="control-label hidden-xs" for="input-quantity"><?php echo $entry_qty; ?></label>
								<input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
								<input type="text" name="quantity1" value="<?php echo $minimum; ?>" size="2" id="input-quantity" class="form-control" />
								<span>
									<i class="fa fa-plus btn btn-default" onclick="quantity(this, '<?php echo $minimum; ?>', '+');"></i>
									<i class="fa fa-minus btn btn-default" onclick="quantity(this, '<?php echo $minimum; ?>', '-');"></i>
								</span>
								<button type="button" onclick="add_quick_order();" data-loading-text="<?php echo $text_loading; ?>" class="add_to_cart btn btn-default btn-lg"><i class="<?php echo $cart_btn_icon; ?>"></i> <span><?php echo $lang['text_quickorder_button']; ?></span></button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<?php if ($options) { ?>
	<?php foreach ($options as $option) { ?>
		<?php if ($option['type'] == 'date' || $option['type'] == 'datetime' || $option['type'] == 'time') { ?>
			<link type="text/css" href="catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen" />
			<script type="text/javascript" src="catalog/view/javascript/jquery/datetimepicker/moment.js"></script> 
			<script type="text/javascript" src="catalog/view/javascript/jquery/datetimepicker/locale/ru.js"></script> 
			<script type="text/javascript" src="catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js"></script>
			<style>.bootstrap-datetimepicker-widget {z-index: 9999999999!important;position:absolute !important}</style>
			<script>
				$('.date').datetimepicker({
					pickTime: false
				});
				$('.datetime').datetimepicker({
					pickDate: true,
					pickTime: true
				});
				$('.time').datetimepicker({
					pickDate: false
				});
			</script>
		<?php } ?>
	<?php } ?>
<?php } ?>
<script type="text/javascript">
 $('.radio:first-child').find('input[type="radio"]').attr('checked','checked');
 </script>

<script type="text/javascript">
	function quantity(data, minimum, flag) {
                                        	
											var input = $(data).parent().prev();
											var minimum = parseFloat(minimum);
																						
											if($('span').is('.option-quantity-custom1')){
                                                parent = $('input[type="radio"]:checked').parent();
                                                child = $(parent).find(".option-quantity-custom1").text();                                            
                                                var maximum = parseFloat(child);                                           
                                            }else{
                                                var maximum = <?php echo $quantity;?>;
                                            }
											if(flag == '+') {
												if(input.val() < maximum) {
													input.val(parseFloat(input.val())+1);
												}
											}
											if(flag == '-') {
    												if(input.val() > minimum) {
    													input.val(parseFloat(input.val())-1);
    												}
    											}
    								}
</script>
                                        <script type="text/javascript">
                                            $('input.quick-page-option[type="radio"]').on('click', function () {
                                                var quantity = $('input[name="quantity1"]').val();
                                                var quantity_options = $(this).parent();
                                                quantity_options = quantity_options.find('.option-quantity-custom1').text();
                                                quantity_options = parseFloat(quantity_options);
                                                if(quantity > quantity_options){
                                                    $('input[name="quantity1"]').val(quantity_options);
                                                }
                                            });
</script>

<script type="text/javascript">
                                    function price_format(n) {
                                        c = 0;
                                        d = '.'; // decimal separator
                                        t = ' '; // thousands separator
                                        s_left = '';
                                        s_right = ' р.';

                                        n = n * 1.00000000;

                                        //sign = (n < 0) ? '-' : '';

                                        //extracting the absolute value of the integer part of the number and converting to string
                                        i = parseFloat(n = Math.abs(n).toFixed(c)) + '';

                                        j = ((j = i.length) > 3) ? j % 3 : 0;
                                        return s_left + (j ? i.substr(0, j) + t : '') + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t) + (c ? d + Math.abs(n - i).toFixed(c).slice(2) : '') + s_right;
                                    }
                                    
                                    animate_delay = 20;
                                    <?php if ($special == ''){ 
																		   echo "var str_price = '" . stristr($price, ' р', true) . "';";
																		}else{
																		   echo "var str_price = '" . stristr($special, ' р', true) . "';";
																		} ?>
                                    str_price = str_price.replace(" ", "");
                                    var start_price = parseFloat(str_price);

                                    main_price_final = start_price;
                                    main_price_start = start_price;
                                    main_step = 0;
                                    main_timeout_id = 0;

                                    function animateMainPrice_callback() {
                                        main_price_start += main_step;

                                        if ((main_step > 0) && (main_price_start > main_price_final)) {
                                            main_price_start = main_price_final;
                                        } else if ((main_step < 0) && (main_price_start < main_price_final)) {
                                            main_price_start = main_price_final;
                                        } else if (main_step == 0) {
                                            main_price_start = main_price_final;
                                        }

                                        $('.autocalc-product-price').html(price_format(main_price_start));

                                        if (main_price_start != main_price_final) {
                                            main_timeout_id = setTimeout(animateMainPrice_callback, animate_delay);
                                        }
                                    }

                                    function animateMainPrice(price) {
                                        main_price_start = main_price_final;
                                        main_price_final = price;
                                        main_step = (main_price_final - main_price_start) / 10;
                                        
                                        clearTimeout(main_timeout_id);
                                        main_timeout_id = setTimeout(animateMainPrice_callback, animate_delay);
                                    }

                                    function recalculateprice() {
                                        <?php if ($special == ''){ 
                                           echo "var str_price = '" . stristr($price, ' р', true) . "';";
                                        }else{
                                           echo "var str_price = '" . stristr($special, ' р', true) . "';";
                                        } ?>
                                        str_price = str_price.replace(" ", "");
                                        var main_price = parseFloat(str_price);

                                        var input_quantity = Number($('input[name="quantity1"]').val());
                                        var special = 0;
                                        var tax = 0;

                                        if (isNaN(input_quantity)) input_quantity = 0;


                                        var option_price = 0;

                                        if ($('input.quick-page-option[type="radio"]').is(':checked')){
 
                                            parent = $('input.quick-page-option:checked').parent();
                                            child = $(parent).find(".option-price_c").text();
                                            child = child.substr("1");
                                            if(child == ""){
                                                option_price = 0;
                                            }
                                            else{
                                                option_price = parseFloat(child);    
                                            }                              
                                            special += option_price;
                                            main_price += option_price;
                                        }

                                        main_price *= input_quantity;
                                        special *= input_quantity;
                                        tax *= input_quantity;

                                        animateMainPrice(Number(main_price));
                                    }

                                    $(document).ready(function() {
                                        $('input[type="checkbox"]').bind('change', function() { recalculateprice(); });
                                        $('input.quick-page-option[type="radio"]').bind('change', function() { recalculateprice(); });
                                        $('select').bind('change', function() { recalculateprice(); });
                                        
                                        $quantity = $('input[name="quantity1"]');
                                        $quantity.data('val', $quantity.val());
                                        (function() {
                                            if ($quantity.val() != $quantity.data('val')) {
                                                $quantity.data('val', $quantity.val());
                                                recalculateprice();
                                            }
                                            setTimeout(arguments.callee, 250);
                                        })();

                                        recalculateprice();
                                    });
</script>
<script type="text/javascript" src="catalog/view/theme/unishop/js/jquery.maskedinput.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#quick_order .image-additional img').each(function() {
			$(this).hover(function() {
				$('#quick_order .image > .img-responsive').attr('src', $(this).attr('data-image'))
			});
		});
<?php if($change_opt_img_q) { ?>		
		$('#quick_order .option input[type=\'radio\'] + .img').on('click', function() {
			$('#quick_order .image > .img-responsive').attr('src', $(this).attr('data-thumb'));
		});
<?php } ?>
	});
	$('body').on('focus', '.customer_phone', function(){
		$(this).mask('<?php echo $phone_mask; ?>');
	});
</script>
