<!--
<section class="fullCenter">
		<form class="grid" method="post" action="index.php?page=sec_register">
				<section class="depth-1 row col-12 col-m-8 offset-m-2 col-xl-6 offset-xl-3">
						<h1 class="col-12">Crea tu cuenta</h1>
				</section>
				<section class="depth-1 py-5 row col-12 col-m-8 offset-m-2 col-xl-6 offset-xl-3">
						<div class="row">
								<label class="col-12 col-m-4 flex align-center" for="txtEmail">Correo Electrónico</label>
								<div class="col-12 col-m-8">
										<input class="width-full" type="email" id="txtEmail" name="txtEmail" value="{{txtEmail}}"/>
								</div>
								{{if errorEmail}}
								<div class="error col-12 py-2 col-m-8 offset-m-4">{{errorEmail}}</div>
								{{endif errorEmail}}
						</div>
						<div class="row">
								<label class="col-12 col-m-4 flex align-center" for="txtPswd">Contraseña</label>
								<div class="col-12 col-m-8">
										<input class="width-full" type="password" id="txtPswd" name="txtPswd" value="{{txtPswd}}"/>
								</div>
								{{if errorPswd}}
								<div class="error col-12 py-2 col-m-8 offset-m-4">{{errorPswd}}</div>
								{{endif errorPswd}}
						</div>
						<div class="row right flex-end px-4">
								<button class="primary" id="btnSignin" type="submit">Crear Cuenta</button>
						</div>
				</section>
		</form>
</section>
-->



<form class="grid" method="post"
      action="index.php?page=sec_register">
		<div class="bg-light py-3 py-md-5">
				<div class="container">
						<div class="row justify-content-md-center">
								<div class="col-12 col-md-11 col-lg-8 col-xl-7 col-xxl-6">
										<div class="bg-white p-4 p-md-5 rounded shadow-sm">
												<div class="row">
														<div class="col-12">
																<div class="mb-5">
																		<h3>Crear Cuenta</h3>
																</div>
														</div>
												</div>
												<form action="#!">
														<div class="row gy-3 gy-md-4 overflow-hidden">
																<div class="col-12">
																		<label for="txtEmail" class="form-label">Email <span
																						class="text-danger">*</span></label>
																		<input type="email" class="form-control" id="txtEmail" name="txtEmail"
																		       value="{{txtEmail}}"
																		       placeholder="name@example.com" required>

																		{{if errorEmail}}
																		<div class="error col-12 py-2 col-m-8 offset-m-4">{{errorEmail}}</div>
																		{{endif errorEmail}}


																</div>
																<div class="col-12">
																		<label for="txtPswd" class="form-label">Contraseña<span
																						class="text-danger">*</span></label>
																		<input type="password" class="form-control" id="txtPswd" name="txtPswd"
																		       value="{{txtPswd}}" required>

																		{{if errorPswd}}
																		<div class="error col-12 py-2 col-m-8 offset-m-4">{{errorPswd}}</div>
																		{{endif errorPswd}}
																</div>

																{{if generalError}}
																<div class="row">
																		{{generalError}}
																</div>
																{{endif generalError}}


																<div class="col-12">
																		<div class="d-grid">
																				<button class="btn btn-lg btn-primary" type="submit">Crear Cuenta</button>
																		</div>
																</div>
														</div>
												</form>
												<div class="row">
														<div class="col-12">
																<hr class="mt-5 mb-4 border-secondary-subtle">
																<div class="d-flex gap-2 gap-md-4 flex-column flex-md-row justify-content-md-end">
																<span>Ya tienes una cuenta? Ingresa <a href="index.php?page=sec_login"
																                                        class="text-decoration-none text-decoration-underline">aqui
																</a></span>

																</div>
														</div>
												</div>

										</div>
								</div>
						</div>
				</div>
		</div>
</form>
