<!DOCTYPE html>
<html>

<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>{{SITE_TITLE}}</title>
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
		<link rel="stylesheet" href="/{{BASE_DIR}}/public/css/main.css"/>

		<!-- Bootstrap icons -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" rel="stylesheet">
		<!-- Font Awesome -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
		<!-- Bootstrap CSS -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
		      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
		<!-- material icons -->
		<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

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
		<input type="checkbox" class="menu_toggle" id="menu_toggle"/>
		<label for="menu_toggle" class="menu_toggle_icon">
				<div class="hmb dgn pt-1"></div>
				<div class="hmb hrz"></div>
				<div class="hmb dgn pt-2"></div>
		</label>
		<h1>{{SITE_TITLE}}</h1>
		<nav id="menu">
				<ul>
						<li><a href="index.php?page={{PRIVATE_DEFAULT_CONTROLLER}}"><i class="fas fa-home"></i>&nbsp;Inicio</a></li>
						{{foreach NAVIGATION}}
						<li><a href="{{nav_url}}">{{nav_label}}</a></li>
						{{endfor NAVIGATION}}
						<li><a href="index.php?page=sec_logout"><i class="fas fa-sign-out-alt"></i>&nbsp;Salir</a></li>
				</ul>
		</nav>
		{{with login}}
		<span class="username">{{userName}} <a href="index.php?page=sec_logout"><i
						class="fas fa-sign-out-alt"></i></a></span>
		{{endwith login}}
</header>
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


								<a class="nav-link" href="index.php?page={{PRIVATE_DEFAULT_CONTROLLER}}">Inicio</a>
								{{foreach NAVIGATION}}
								<a class="nav-link" href="{{nav_url}}">{{nav_label}}</a>
								{{endfor NAVIGATION}}

								<a class="nav-link" href="index.php?page=Libros_Catalogo">Libros</a>

								<a class="btn nav-link" type="submit" href="index.php?page=Checkout_Carrito">
										<i class="bi-cart-fill me-1"></i>
										Carrito
										<span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
								</a>
								
								<!--
								{{with login}}

								<span class="username">{{userName}} <a href="index.php?page=sec_logout"><i
												class="fas fa-sign-out-alt"></i></a></span>

								{{endwith login}}
								<a class="nav-link" href="index.php?page=sec_logout">Salir</a>
-->
								
								<div class="dropdown">
										{{with login}}
										<a class="nav-link dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
										   data-bs-toggle="dropdown" aria-expanded="false">
												<span>{{userName}}</span> 
										</a>
										{{endwith login}}

										<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
												<li><a class="dropdown-item" href="index.php?page=Libros_Ordenes">Ver Ordenes</a></li>
												<li><a class="dropdown-item" href="index.php?page=sec_logout"><i
																class="fas fa-sign-out-alt"></i> Salir</a></li>
												
										</ul>
								</div>
						</div>
				</div>
		</div>
</nav>


<main>
		{{{page_content}}}
</main>


<footer>
		<div>Todo los Derechos Reservados {{~CURRENT_YEAR}} &copy;</div>
</footer>
{{foreach EndScripts}}
<script src="/{{~BASE_DIR}}/{{this}}"></script>
{{endfor EndScripts}}

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>
