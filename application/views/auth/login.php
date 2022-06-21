<div class="login-box pt-5">
	<!-- /.login-logo -->
	<div class="login-box-body">
		<h3 class="text-center mt-0 mb-4">
			<b>C</b>omputer <b>B</b>ased <b>T</b>est
		</h3>
		<p class="login-box-msg">Silahkan masukkan email & password yang telah di berikan</p>

		<div id="infoMessage" class="text-center"><?php echo $message; ?></div>

		<?= form_open("auth/cek_login", array('id' => 'login')); ?>
		<div class="form-group has-feedback">
			<?= form_input($identity); ?>
			<span class="fa fa-envelope form-control-feedback"></span>
			<span class="help-block"></span>
		</div>
		<div class="form-group has-feedback">
			<?= form_input($password); ?>
			<span class="glyphicon glyphicon-lock form-control-feedback"></span>
			<span class="help-block"></span>
		</div>
		<div class="row">
			<div class="col-xs-8">
				<div class="checkbox icheck">
					<label>
						<?= form_checkbox('remember', '', FALSE, 'id="remember"'); ?> Ingat Saya
					</label>
				</div>
			</div>
			<!-- /.col -->
			<div class="col-xs-4">
				<?= form_submit('submit', lang('login_submit_btn'), array('id' => 'submit', 'class' => 'btn btn-primary btn-block btn-flat')); ?>
			</div>
			<!-- /.col -->
		</div>
		<?= form_close(); ?>

		<a href="<?= base_url() ?>auth/forgot_password" class="text-center"><?= lang('login_forgot_password'); ?></a>
		<div>
			<a>
				<img src="<?= base_url() ?>assets/dist/img/kampus_merdeka.png" width="50" height="30">

				<img src="<?= base_url() ?>assets/dist/img/kampungberseriastra.png" width="50" height="30">

				<img src="<?= base_url() ?>assets/dist/img/LOGO MBKM 02.png" width="40" height="40">

				<img src="<?= base_url() ?>assets/dist/img/UWP RESEARCH.png" width="80" height="25">

			</a>
		</div>

	</div>
</div>

<script type="text/javascript">
	let base_url = '<?= base_url(); ?>';
</script>
<script src="<?= base_url() ?>assets/dist/js/app/auth/login.js"></script>