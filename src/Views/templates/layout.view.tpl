<!DOCTYPE html>
<html>
<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>{{SITE_TITLE}}</title>
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
		<link rel="stylesheet" href="/{{~BASE_DIR}}/public/css/main.css"/>

		<!-- Bootstrap icons -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" rel="stylesheet">
		<!-- Font Awesome -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
		<!-- Bootstrap CSS -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
		      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
		<!-- material icons -->
		<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

		{{foreach SiteLinks}}
		<link rel="stylesheet" href="/{{~BASE_DIR}}/{{this}}"/>
		{{endfor SiteLinks}}
		{{foreach BeginScripts}}
		<script src="/{{~BASE_DIR}}/{{this}}"></script>
		{{endfor BeginScripts}}
</head>
<body>

<!--
 <header>
	 <input type="checkbox" class="menu_toggle" id="menu_toggle" />
	 <label for="menu_toggle" class="menu_toggle_icon" >
		 <div class="hmb dgn pt-1"></div>
		 <div class="hmb hrz"></div>
		 <div class="hmb dgn pt-2"></div>
	 </label>
	 <h1>{{SITE_TITLE}}</h1>
	 <nav id="menu">
		 <ul>
			 <li><a href="index.php?page={{PUBLIC_DEFAULT_CONTROLLER}}"><i class="fas fa-home"></i>&nbsp;Inicio</a></li>
			 {{foreach PUBLIC_NAVIGATION}}
					 <li><a href="{{nav_url}}">{{nav_label}}</a></li>
			 {{endfor PUBLIC_NAVIGATION}}
		 </ul>
	 </nav>
 </header>
 -->
<!-- Navigation
<nav class="navbar navbar-expand-lg navbar-light bg-light mb-5 mt-3">
		<div class="container px-4 px-lg-5">
				<a class="navbar-brand" href="#!">E-Books</a>
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span
								class="navbar-toggler-icon"></span></button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
								<li class="nav-item"><a class="nav-link active" aria-current="page" href="#!">Inicio</a></li>
								<li class="nav-item"><a class="nav-link active" aria-current="page" href="#!">Best Sellers</a></li>
								<li class="nav-item"><a class="nav-link active" aria-current="page" href="#!">Best Authors</a></li>
								<li class="nav-item dropdown">
										<a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button"
										   data-bs-toggle="dropdown" aria-expanded="false">Comprar</a>
										<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
												<li><a class="dropdown-item" href="#!">Productos</a></li>
												<li>
														<hr class="dropdown-divider"/>
												</li>
												<li><a class="dropdown-item" href="#!">Libros Destacados</a></li>
												<li><a class="dropdown-item" href="#!">New Arrivals</a></li>
										</ul>
								</li>
						</ul>
						<form class="d-flex">
								<button class="btn" type="submit">
										<i class="bi-cart-fill me-1"></i>
										Carrito
										<span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
								</button>
						</form>

						<form class="d-flex px-4">
								<button class="btn btn-outline-dark" type="submit">
										<i class="bi bi-person"></i>
										Iniciar Sesion
								</button>
						</form>
						
				</div>
		</div>
</nav>
-->

<nav class="navbar navbar-expand-lg mb-5 mt-3">
		<div class="container d-flex">
				<a class="navbar-brand" href="index.php">

						<img class="logo" loading="lazy" src="/{{~BASE_DIR}}/public/img/logo.jpg"
						     alt="logo"/>

				</a>

				<button class="navbar-toggler shadow-none border-0 " type="button" data-bs-toggle="collapse"
				        data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false"
				        aria-label="Toggle navigation">
						<i class="bi bi-list"></i>
				</button>

				<div class="collapse navbar-collapse justify-content-end" id="navbarNavAltMarkup">
						<div class="navbar-nav align-items-center">

					
								<a href="index.php?page={{PUBLIC_DEFAULT_CONTROLLER}}" class="nav-link active">Inicio</a>
								
								{{foreach PUBLIC_NAVIGATION}}
								<a href="{{nav_url}}" class="nav-link">{{nav_label}}</a>
								{{endfor PUBLIC_NAVIGATION}}
								

								<a class="btn nav-link" type="submit" href="index.php?page=Checkout_Carrito">
										<i class="bi-cart-fill me-1"></i>
										Carrito
										<span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
								</a>
								
								<a href="index.php?page=sec_login" class="btn">Iniciar Sesion</a>
								<a href="index.php?page=sec_register" class="btn btn-primary">Registrarse</a>
						</div>
				</div>
		</div>
</nav>

<main>
		{{{page_content}}}
</main>


<!-- Footer -->
<footer class="text-center text-lg-start bg-body-tertiary text-muted mt-5">
		<!-- Section: Social media -->
		<section class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom">
				<!-- Left -->
				<div class="me-5 d-none d-lg-block">
						<span>Siguenos en Nuestras Redes Sociales</span>
				</div>
				<!-- Left -->

				<!-- Right -->
				<div>
						<a href="#" target="_blank" class="me-4 text-reset">
								<i class="fab fa-facebook-f"></i>
						</a>

						<a href="#" target="_blank" class="me-4 text-reset">
								<i class="fab fa-instagram"></i>
						</a>

						<a href="#"
						   target="_blank" class="me-4 text-reset">
								<i class="fab fa-whatsapp"></i>
						</a>

				</div>
				<!-- Right -->
		</section>
		<!-- Section: Social media -->

		<!-- Section: Links  -->
		<section class="">
				<div class="container text-center text-md-start mt-5">
						<!-- Grid row -->
						<div class="row mt-3">
								<!-- Grid column -->
								<div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
										<!-- Content -->
										<h6 class="text-uppercase fw-bold mb-4">
												<i class="fas fa-gem me-3"></i>The Book Place
										</h6>
										<p>
												Somos una tienda online en la cual podras obtener tus libros favoritos.
										</p>
								</div>
								<!-- Grid column -->

								<!-- Grid column -->
								<div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
										<!-- Links -->
										<h6 class="text-uppercase fw-bold mb-4">
												Categorias
										</h6>
										<p>
												<a href="#!" class="text-reset">Autoyuda</a>
										</p>
										<p>
												<a href="#!" class="text-reset">Poesia</a>
										</p>
										<p>
												<a href="#!" class="text-reset">Romanticos</a>
										</p>
										<p>
												<a href="#!" class="text-reset">Infantiles</a>
										</p>
								</div>
								<!-- Grid column -->

								<!-- Grid column -->
								<div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
										<!-- Links -->
										<h6 class="text-uppercase fw-bold mb-4">
												Enlaces Útiles
										</h6>
										<p>
												<a href="/proyecto_final-pw2/html/acercaDe.html" class="text-reset">Acerca de nosotros</a>
										</p>
										<p>
												<a href="/proyecto_final-pw2/html/faqs.html" class="text-reset">FAQ</a>
										</p>
										<p>
												<a href="/proyecto_final-pw2/html/contactanos.html" class="text-reset">Contactanos</a>
										</p>
										<p>
												<a href="/proyecto_final-pw2/html/menu.html" class="text-reset">Libros</a>
										</p>

								</div>
								<!-- Grid column -->

								<!-- Grid column -->
								<div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
										<!-- Links -->
										<h6 class="text-uppercase fw-bold mb-4">Cantactanos</h6>

										<i class="fas fa-envelope me-3"></i>
										thebookplace@gmail.com
										</p>
										<p><i class="fas fa-phone me-3"></i> +504 9777-5777</p>
								</div>
								<!-- Grid column -->
						</div>
						<!-- Grid row -->
				</div>
		</section>
		<!-- Section: Links  -->

		<!-- Copyright -->
		<div class="text-center p-4" style="background-color: rgba(0, 0, 0, 0.05);">
				© 2021 Copyright:
		</div>
		<!-- Copyright -->
</footer>
<!-- Footer -->


{{foreach EndScripts}}
<script src="/{{~BASE_DIR}}/{{this}}"></script>
{{endfor EndScripts}}

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>
