<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-payment" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger alert-dismissible"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
	<?php if ($success) { ?>
		<div class="alert alert-success alert-dismissible"><i class="fa fa-exclamation-circle"></i> <?php echo $success; ?>
		  <button type="button" class="close" data-dismiss="alert">&times;</button>
		</div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-payment" class="form-horizontal">
			<ul class="nav nav-tabs">
				<li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
				<li><a href="#tab-status" data-toggle="tab"><?php echo $tab_status; ?></a></li>
				<li><a href="#tab-added" data-toggle="tab"><?php echo $tab_added; ?></a></li>
				<li><a href="#tab-design" data-toggle="tab"><?php echo $tab_design; ?></a></li>
				<li><a href="#tab-log" data-toggle="tab"><?php echo $tab_log; ?></a></li>
			</ul>
			
			<div class="tab-content">
				<div class="tab-pane active" id="tab-general">
					<div class="form-group required">
						<label class="col-sm-2 control-label" for="input-login"><span data-toggle="tooltip" title="<?php echo $help_login; ?>"><?php echo $entry_login; ?></span></label>
						<div class="col-sm-10">
						  <input type="text" name="rozetka_ec_login" value="<?php echo $rozetka_ec_login; ?>" placeholder="<?php echo $entry_login; ?>" id="input-login" class="form-control" />
						  <?php if ($error_login) { ?>
						  <div class="text-danger"><?php echo $error_login; ?></div>
						  <?php } ?>
						</div>
					</div>
					<div class="form-group required">
						<label class="col-sm-2 control-label" for="input-password"><span data-toggle="tooltip" title="<?php echo $help_password; ?>"><?php echo $entry_password; ?></span></label>
						<div class="col-sm-10">
						  <input type="text" name="rozetka_ec_password" value="<?php echo $rozetka_ec_password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
						  <?php if ($error_password) { ?>
						  <div class="text-danger"><?php echo $error_password; ?></div>
						  <?php } ?>
						</div>
					</div>					
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
						<div class="col-sm-10">
						  <select name="rozetka_ec_status" id="input-status" class="form-control">
							<?php if ($rozetka_ec_status) { ?>
							<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
							<option value="0"><?php echo $text_disabled; ?></option>
							<?php } else { ?>
							<option value="1"><?php echo $text_enabled; ?></option>
							<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
							<?php } ?>
						  </select>
						</div>
					</div>
				</div>
				<div class="tab-pane" id="tab-status">
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-order-status"><?php echo $entry_order_status; ?></label>
						<div class="col-sm-10">
						  <select name="rozetka_ec_order_status_id" id="input-order-status" class="form-control">
							<?php foreach ($order_statuses as $order_status) { ?>
							<?php if ($order_status['order_status_id'] == $rozetka_ec_order_status_id) { ?>
							<option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
							<?php } else { ?>
							<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
							<?php } ?>
							<?php } ?>
						  </select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-order-fail"><?php echo $entry_order_fail; ?></label>
						<div class="col-sm-10">
						  <select name="rozetka_ec_order_fail_status_id" id="input-order-fail" class="form-control">
							<?php foreach ($order_statuses as $order_status) { ?>
							<?php if ($order_status['order_status_id'] == $rozetka_ec_order_fail_status_id) { ?>
							<option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
							<?php } else { ?>
							<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
							<?php } ?>
							<?php } ?>
						  </select>
						</div>
					</div>
					<div class="form-group hidden">
						<label class="col-sm-2 control-label" for="input-order-success-hold"><?php echo $entry_order_success_hold; ?></label>
						<div class="col-sm-10">
						  <select name="rozetka_ec_order_success_hold_status_id" id="input-order-success-hold" class="form-control">
							<?php foreach ($order_statuses as $order_status) { ?>
							<?php if ($order_status['order_status_id'] == $rozetka_ec_order_success_hold_status_id) { ?>
							<option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
							<?php } else { ?>
							<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
							<?php } ?>
							<?php } ?>
						  </select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-order-refund"><?php echo $entry_order_refund; ?></label>
						<div class="col-sm-10">
						  <select name="rozetka_ec_order_refund_status_id" id="input-order-refund" class="form-control">
							<?php foreach ($order_statuses as $order_status) { ?>
							<?php if ($order_status['order_status_id'] == $rozetka_ec_order_refund_status_id) { ?>
							<option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
							<?php } else { ?>
							<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
							<?php } ?>
							<?php } ?>
						  </select>
						</div>
					</div>
				</div>
				<div class="tab-pane" id="tab-added">
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="form-group">
								<label class="col-sm-3 control-label" for="input-button-cart"><?php echo $entry_button_cart; ?></label>
								<div class="col-sm-9">
								  <select name="rozetka_ec_button_cart" id="input-button-cart" class="form-control">
									<?php if ($rozetka_ec_button_cart) { ?>
									<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
									<option value="0"><?php echo $text_disabled; ?></option>
									<?php } else { ?>
									<option value="1"><?php echo $text_enabled; ?></option>
									<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
									<?php } ?>
								  </select>
								</div>
							</div>
							<div class="form-group <?php echo $rozetka_ec_button_cart == false ? 'hidden' : ''; ?>">
								<label class="col-sm-3 control-label" for="input-button-cart-js"><span data-toggle="tooltip" title="<?php echo $help_button_cart_js; ?>"><?php echo $entry_button_cart_js; ?></span></label>
								<div class="col-sm-6">
									<input type="text" name="rozetka_ec_button_cart_js" value="<?php echo $rozetka_ec_button_cart_js; ?>" placeholder="<?php echo $entry_button_cart_js; ?>" id="input-button-cart-js" class="form-control" />
									<a href="#" style="border-bottom:1px dotted;" onclick="reset($(this)); return false;"><?php echo $text_selector_default; ?></a>
								</div>
								<div class="col-sm-3">
								  <select name="rozetka_ec_position_button_cart_js" id="input-position-button-cart-js" class="form-control">
										<?php foreach($positions as $key => $position) { ?>
										<?php if ($rozetka_ec_position_button_cart_js == $key) { ?>
										<option value="<?php echo $key; ?>" selected="selected"><?php echo $position; ?></option>
										<?php } else { ?>
										<option value="<?php echo $key; ?>"><?php echo $position; ?></option>
										<?php } ?>
										<?php } ?>
								  </select>
								</div>
							</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="form-group">
								<label class="col-sm-3 control-label" for="input-button-product"><?php echo $entry_button_product; ?></label>
								<div class="col-sm-9">
								  <select name="rozetka_ec_button_product" id="input-button-product" class="form-control">
									<?php if ($rozetka_ec_button_product) { ?>
									<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
									<option value="0"><?php echo $text_disabled; ?></option>
									<?php } else { ?>
									<option value="1"><?php echo $text_enabled; ?></option>
									<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
									<?php } ?>
								  </select>
								</div>
							</div>
							<div class="form-group <?php echo $rozetka_ec_button_product == false ? 'hidden' : ''; ?>">
								<label class="col-sm-3 control-label" for="input-button-product-js"><span data-toggle="tooltip" title="<?php echo $help_button_cart_js; ?>"><?php echo $entry_button_cart_js; ?></span></label>
								<div class="col-sm-6">
									<input type="text" name="rozetka_ec_button_product_js" value="<?php echo $rozetka_ec_button_product_js; ?>" placeholder="<?php echo $entry_button_cart_js; ?>" id="input-button-product-js" class="form-control" />
									<a href="#" style="border-bottom:1px dotted;" onclick="reset($(this)); return false;"><?php echo $text_selector_default; ?></a>
								</div>
								<div class="col-sm-3">
								  <select name="rozetka_ec_position_button_product_js" id="input-position-button-product-js" class="form-control">
										<?php foreach($positions as $key => $position) { ?>
										<?php if ($rozetka_ec_position_button_product_js == $key) { ?>
										<option value="<?php echo $key; ?>" selected="selected"><?php echo $position; ?></option>
										<?php } else { ?>
										<option value="<?php echo $key; ?>"><?php echo $position; ?></option>
										<?php } ?>
										<?php } ?>
								  </select>
								</div>
							</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="form-group">
								<label class="col-sm-3 control-label" for="input-button-checkout"><?php echo $entry_button_checkout; ?></label>
								<div class="col-sm-9">
								  <select name="rozetka_ec_button_checkout" id="input-button-checkout" class="form-control">
									<?php if ($rozetka_ec_button_checkout) { ?>
									<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
									<option value="0"><?php echo $text_disabled; ?></option>
									<?php } else { ?>
									<option value="1"><?php echo $text_enabled; ?></option>
									<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
									<?php } ?>
								  </select>
								</div>
							</div>
							<div class="form-group <?php echo $rozetka_ec_button_checkout == false ? 'hidden' : ''; ?>">
								<label class="col-sm-3 control-label" for="input-button-checkout-js"><span data-toggle="tooltip" title="<?php echo $help_button_cart_js; ?>"><?php echo $entry_button_cart_js; ?></span></label>
								<div class="col-sm-6">
									<input type="text" name="rozetka_ec_button_checkout_js" value="<?php echo $rozetka_ec_button_checkout_js; ?>" placeholder="<?php echo $entry_button_cart_js; ?>" id="input-button-checkout-js" class="form-control" />
									<a href="#" style="border-bottom:1px dotted;" onclick="reset($(this)); return false;"><?php echo $text_selector_default; ?></a>
								</div>
								<div class="col-sm-3">
								  <select name="rozetka_ec_position_button_checkout_js" id="input-position-button-checkout-js" class="form-control">
										<?php foreach($positions as $key => $position) { ?>
										<?php if ($rozetka_ec_position_button_checkout_js == $key) { ?>
										<option value="<?php echo $key; ?>" selected="selected"><?php echo $position; ?></option>
										<?php } else { ?>
										<option value="<?php echo $key; ?>"><?php echo $position; ?></option>
										<?php } ?>
										<?php } ?>
								  </select>
								</div>
							</div>
						</div>
					</div>
				</div>				
				<div class="tab-pane" id="tab-design">
				<div class="col-sm-6">
					<div class="form-group">
						<label class="col-sm-4 control-label" for="input-button-variant"><?php echo $entry_button_variant; ?></label>
						<div class="col-sm-8">
							<select name="rozetka_ec_button_variant" id="input-button-variant" class="form-control">
								<?php foreach($variants as $key => $variant) { ?>
								<?php if ($rozetka_ec_button_variant == $key) { ?>
								<option value="<?php echo $key; ?>" selected="selected"><?php echo $variant; ?></option>
								<?php } else { ?>
								<option value="<?php echo $key; ?>"><?php echo $variant; ?></option>
								<?php } ?>
								<?php } ?>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label" for="input-button-color"><?php echo $entry_color_button; ?></label>
						<div class="col-sm-8">
							<select name="rozetka_ec_button_color" id="input-button-color" class="form-control">
								<option value="black" <?php echo $rozetka_ec_button_color == 'black' ? 'selected="selected"' : ''; ?>><?php echo $text_black; ?></option>
								<option value="white" <?php echo $rozetka_ec_button_color == 'white' ? 'selected="selected"' : ''; ?>><?php echo $text_white; ?></option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4 control-label" for="input-button-css"><span data-toggle="tooltip" title="<?php echo $help_button_css; ?>"><?php echo $entry_button_css; ?></span></label>
						<div class="col-sm-8">
							<textarea name="rozetka_ec_button_css" placeholder="<?php echo $entry_button_css; ?>" id="input-button-css" class="form-control" rows="8"><?php echo $rozetka_ec_button_css; ?></textarea>
						</div>
					</div>
				</div>

				<div class="col-sm-6 text-center">
					<h3><?php echo $text_preview; ?></h3>
					<div class="demo-button">
						<button class="btn btn-success btn-rozetka">
							<span><?php echo $text_buy_rpay; ?></span> 
							<img src="view/image/payment/rozetka_ec/rozetka_ec_logo_<?php echo $rozetka_ec_button_variant ? $rozetka_ec_button_variant : 'variant_1'; ?>_white.svg" class="img-responsive" alt="<?php echo $text_buy_rpay; ?>" />
						</button>
					</div>
				</div>

				</div>
				<div class="tab-pane" id="tab-log">
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-status-log"><?php echo $entry_status_log; ?></label>
						<div class="col-sm-10">
						  <select name="rozetka_ec_status_log" id="input-status-log" class="form-control">
							<?php if ($rozetka_ec_status_log) { ?>
							<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
							<option value="0"><?php echo $text_disabled; ?></option>
							<?php } else { ?>
							<option value="1"><?php echo $text_enabled; ?></option>
							<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
							<?php } ?>
						  </select>
						</div>
					</div>
					<?php if ($error_warning_log) { ?>
					<div class="alert alert-danger"><?php echo $error_warning_log; ?></div>
					<?php } ?>
					<p>
					  <textarea wrap="off" readonly rows="15" class="form-control"><?php echo $log; ?></textarea>
					</p>
					<div class="text-right"><?php if ($error_warning_log) { ?><a href="<?php echo $download_log; ?>" data-toggle="tooltip" title="<?php echo $button_download; ?>" class="btn btn-primary"><i class="fa fa-download"></i></a><?php } ?> <a href="<?php echo $clear_log; ?>" class="btn btn-danger"><i class="fa fa-eraser"></i> <?php echo $button_clear; ?></a></div>
				</div>
			</div>
        </form>
      </div>
    </div>
  </div>
  <script>
	$('#language a:first').tab('show');
	
	$('#input-button-color, #input-button-variant').on('change', function() {
		setButton();		
	});
	
	function setButton() {
		let color = $('#input-button-color').val();
		let variant = $('#input-button-variant').val();
		
		if(color == 'white') {
			$('.btn-rozetka, .demo-button').addClass('white');
			
			$('.btn-rozetka img').attr('src', 'view/image/payment/rozetka_ec/rozetka_ec_logo_' + variant + '_black.svg');
		} else {
			$('.btn-rozetka, .demo-button').removeClass('white');
			
			$('.btn-rozetka img').attr('src', 'view/image/payment/rozetka_ec/rozetka_ec_logo_' + variant + '_white.svg');
		}
	}
	
	$('.btn-rozetka').on('click', function() {
		return false;
	});
	
	$(document).ready(function() {		
		$('input[name="rozetka_ec_button_text[<?php echo $language_id; ?>]"]').on('input', function() {
			var text = $(this).val();
			
			if(text.length) {
				$('.btn-rozetka>span').text(text);
			} else {
				$('.btn-rozetka>span').text('<?php echo $text_buy_rpay; ?>');
			}
		});
	});
	
	$('select[name="rozetka_ec_button_cart"]').on('change', function() {
		var vl = $(this).val();

		if(vl == true) {
			$('label[for="input-button-cart-js"]').parent('.form-group').removeClass('hidden');
		} else {
			$('label[for="input-button-cart-js"]').parent('.form-group').addClass('hidden');
		}
		
		var sel = $('#input-button-cart-js').val();
		
		if(sel.length == false) {
			$('input[name="rozetka_ec_button_cart_js"]').next('a').trigger('click');
		}
	});	
	
	$('select[name="rozetka_ec_button_product"]').on('change', function() {
		var vl = $(this).val();

		if(vl == true) {
			$('label[for="input-button-product-js"]').parent('.form-group').removeClass('hidden');
		} else {
			$('label[for="input-button-product-js"]').parent('.form-group').addClass('hidden');
		}
		
		var sel = $('#input-button-product-js').val();
		
		if(sel.length == false) {
			$('input[name="rozetka_ec_button_product_js"]').next('a').trigger('click');
		}
	});	
	
	$('select[name="rozetka_ec_button_checkout"]').on('change', function() {
		var vl = $(this).val();

		if(vl == true) {
			$('label[for="input-button-checkout-js"]').parent('.form-group').removeClass('hidden');
		} else {
			$('label[for="input-button-checkout-js"]').parent('.form-group').addClass('hidden');
		}
		
		var sel = $('#input-button-checkout-js').val();
		
		if(sel.length == false) {
			$('input[name="rozetka_ec_button_checkout_js"]').next('a').trigger('click');
		}
	});	
	
	$('select[name="rozetka_ec_mode"]').on('change', function() {
		var vl = $(this).val();

		if(vl == true) {
			$(this).next('.alert').addClass('hidden');
		} else {
			$(this).next('.alert').removeClass('hidden');
		}
	});
	
	function reset(obj) {
		var name = obj.prev('input').attr('name');
		
		if(name == 'rozetka_ec_button_cart_js') {
			$('input[name="rozetka_ec_button_cart_js"]').val('#cart ul>li table + .text-right');
			$('select[name="rozetka_ec_position_button_cart_js"]').val('after').trigger('change');
		}
		
		if(name == 'rozetka_ec_button_product_js') {
			$('input[name="rozetka_ec_button_product_js"]').val('#product #button-cart');
			$('select[name="rozetka_ec_position_button_product_js"]').val('after').trigger('change');
		}
		
		if(name == 'rozetka_ec_button_checkout_js') {
			$('input[name="rozetka_ec_button_checkout_js"]').val('#collapse-checkout-confirm .panel-body .buttons');
			$('select[name="rozetka_ec_position_button_checkout_js"]').val('before').trigger('change');
		}
	}
  </script>
</div>
<?php echo $footer; ?>