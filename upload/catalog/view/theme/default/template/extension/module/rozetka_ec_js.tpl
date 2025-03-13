<link href="catalog/view/theme/default/stylesheet/rozetka_ec.css" rel="stylesheet" type="text/css" />
<script>	
	let button_rozetka_pay = '<?php echo str_replace(array("\n", "\r"), '', $button_rozetka_pay); ?>';
	
	<?php if($button_cart) { ?>
		let validUrlsCart = [
			'index.php?route=common/cart/info',
			'index.php?route=extension/module/luxshop_newfastordercart',
			'index.php?route=octemplates/module/oct_popup_cart',
			'index.php?route=common/aridius_cart/info',
			'index.php?route=extension/module/cart_popup'
		];
		
		<?php if($button_cart_js) { ?>
		let button_cart_sel = '<?php echo $button_cart_js; ?>';
		<?php } else { ?>
		let button_cart_sel = '#cart ul>li table + .text-right';
		<?php } ?>
		
		let position_button_cart = '<?php echo $position_button_cart_js; ?>';
		
		button_rozetka_pay = button_rozetka_pay.replace(/data-mode=".*?"/, 'data-mode="cart"');

		applySelect(button_cart_sel, position_button_cart, button_rozetka_pay);
		
		$(document).on("ajaxComplete", function (event, xhr, settings) {
			if (validUrlsCart.includes(settings.url) || validUrlsCart.some(url => settings.url.indexOf(url) > -1)) {
			  applySelect(button_cart_sel, position_button_cart, button_rozetka_pay);
			}
		});
	<?php } ?>
	
	<?php if($button_product) { ?>
		<?php if($button_product_js) { ?>
		let button_product_sel = '<?php echo $button_product_js; ?>';
		<?php } else { ?>
		let button_product_sel = '#product #button-cart';
		<?php } ?>
		let position_product_cart = '<?php echo $position_button_product_js; ?>';
		
		button_rozetka_pay = button_rozetka_pay.replace(/data-mode=".*?"/, 'data-mode="product"');

		applySelect(button_product_sel, position_product_cart, button_rozetka_pay);
	<?php } ?>
	
	<?php if($button_checkout) { ?>
		let validUrlsCheckout = [
			'index.php?route=checkout/confirm'
		];
		
		<?php if($button_checkout_js) { ?>
		let button_checkout_sel = '<?php echo $button_checkout_js; ?>';
		<?php } else { ?>
		let button_checkout_sel = '#collapse-checkout-confirm .panel-body';
		<?php } ?>
		let position_button_checkout = '<?php echo $position_button_checkout_js; ?>';
		
		button_rozetka_pay = button_rozetka_pay.replace(/data-mode=".*?"/, 'data-mode="checkout"');

		applySelect(button_checkout_sel, position_button_checkout, button_rozetka_pay);
	 
		$(document).on("ajaxComplete", function (event, xhr, settings) {
			if (validUrlsCheckout.includes(settings.url) || validUrlsCheckout.some(url => settings.url.indexOf(url) > -1)) {
			  applySelect(button_checkout_sel, position_button_cart, button_rozetka_pay);
			}
		});
	<?php } ?>
	

	function applySelect(selector, position, html) {
		$(document).find(selector)[position](html);
	}
	
	//фільтрація запитів на створення замовлення
	function rcheckout(elm) {		
		var mode = elm.attr('data-mode');
		
		if(mode == 'product') {
			$('#button-cart').trigger('click');
			
			$(document).off("ajaxComplete").on("ajaxComplete", function (event, xhr, settings) {
				if (settings.url.includes('index.php?route=checkout/cart/add')) {
					var result = JSON.parse(xhr.responseText);
					
					if(result['success']) {
						elm.button('reset');
						
						createOrder(mode);
					}
				}
			});
		} else {		
			createOrder(mode);
		}
	}
	
	//створення замовлення в Opencart, у відповіль адреса платіжної сторінки
	function createOrder(mode) {		
		$.ajax({
			url: 'index.php?route=extension/module/rozetka_ec/createOrder',
			type: 'post',
			data: 'mode=' + mode,
			dataType: 'json',
			success: function(json) {
				if (json['error']) {
					console.log(json['error']);
				}

				if (json['success']) {
					location = json['success'];
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	}
</script>