<!--
<section class="container px-4 px-lg-5">
		<div class="row">

				<div class="col-md-6">
						<span>El bestseller de este mes</span>
						<h2>Conoce tu próximo libro favorito</h2>
						<p>Este es un texto de ejemplo para la sección.</p>
						<button class="btn btn-primary">Compra tu libro aquí</button>
				</div>

				<div class="col-md-6">
						<img src="/{{~BASE_DIR}}/public/img/hero/hero.png" alt="Descripción de la imagen" class="img-fluid">
				</div>
		</div>
</section>
-->

<!-- Hero Section -->
<section class="hero d-flex mb-5 bg-white" data-aos="fade-up" data-aos-duration="3000">
		<div class="container">
				<div class="row justify-content-center">
						<div class="col-md-6 columna">

								<p class="text-hero-regular">
										Bestseller del mes
								</p>
								<p class="text-hero-bold">
										Conoce tu proximo libro favorito
								</p>
								<p class="text-hero-mini">
										Puedes adquir cualquier libro en nuestra tienda, contamos con una gran variedad de libros de
										diferentes categorias.
								</p>

								<a href="index.php?page=Libros_Catalogo">
										<button type="button" class="btn btn-primary btn-hero">Compra tu libro</button>
								</a>
						</div>

						<div class="img-hero col-md-6 aos-init aos-animate" data-aos="fade-up" data-aos-duration="3000">
								<img class="w-100 img-fluid" loading="lazy" width="200" height="100"
								     src="/{{~BASE_DIR}}/public/img/hero/hero.png"
								     alt="hero img"/>
						</div>
				</div>
		</div>

</section>

<header class="container-text py-5">
		<div class="container px-4 px-lg-5 my-5">
				<div class="text-center text-white">
						<h1 class="display-4 fw-bolder">Navega por nuestros productos</h1>
						<p class="lead fw-normal text-white-50 mb-0">Todos nuestros libros</p>
				</div>
		</div>
</header>

<div class="container mt-5">
		<div class="row justify-content-between">
				<!-- Columna para los textos -->
				<div class="col-md-8">
						<p class="display-5 font-weight-bold ">Libros Destacados</p>
						<span class="lead">Libros de autoayuda, Poesia, Romanticos, Novelas y entre muchos otros.</span>
				</div>
				<!-- Columna para el botón -->
				<div class="col-md-4 d-flex flex-column align-items-center justify-content-evenly">
						<a href="index.php?page=Libros_Catalogo">
								<button type="button" class="btn-categorias btn btn-primary ">Todas los Libros -></button>
						</a>
				</div>
		</div>
</div>


<!-- Section-->
<section class="py-5">
		<div class="container mt-5">
				<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">

						{{foreach libros}}
						<div class="col mb-5">
								<div class="card h-100">
										<!-- Product image-->
										<img class="card-img-top" src="\{{~BASE_DIR}}/servidorImagenes/{{libroImgUrl}}" alt="..."/>
										<!-- Product details-->
										<div class="card-body p-4">
												<div class="text-center mb-2">
														<!-- Product name-->
														<h5 class="fw-bolder">{{libroNombre}} - {{libroAutor}}</h5>
														<!-- Product price-->
														${{libroPrecio}}
												</div>

												<span class="text-muted">Solo quedan <span class="text-decoration-underline">{{libroStock}}
												</span> libros en stock</span>
										</div>
										<!-- Product actions-->
										<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
												<div class="text-center">
														<a class="btn btn-outline-dark mt-auto"
														   href="index.php?page=Libros_Catalogo">Comprar
														</a>
												</div>
										</div>
								</div>
						</div>
						{{endfor libros}}

				</div>
		</div>
</section>


<section>
		<div class="container">
				<div class="row">
						<!-- Columna para la imagen y el texto -->
						<div class="col-md-6 position-relative">
								<!-- Texto -->
								<p style="position: absolute; top: 40%; left: 25%; transform: translate(-50%, -50%);"
								   class="text-banner">Contamos con
										<br>libros para todas <br> las edades.</p>
								<!-- Imagen -->
								<img src="/{{~BASE_DIR}}/public/img/hero/banner.jpg" alt="Descripción de la imagen"
								     class="img-fluid rounded-3">
						</div>
						<!-- Columna vacía -->
						<div class="col-md-6 position-relative">
								<!-- Texto -->
								<p style="position: absolute; top: 40%; left: 40%; transform: translate(-50%, -50%);"
								   class="text-banner">Obten un 15% de descuento en libros seleccionados.</p>
								<!-- Imagen -->
								<img src="/{{~BASE_DIR}}/public/img/hero/banner2.jpg" alt="Descripción de la imagen"
								     class="img-fluid rounded-3">
						</div>
				</div>
		</div>
</section>

<section class="newsletter mt-5">
		<div class="container">
				<div class="row">
						<div class="col-sm-12">
								<div class="content">
										<form>
												<h2>SUBSCRIBETE A NUESTRA NEWSLETTER</h2>
												<div class="input-group">
														<input type="email" class="form-control" placeholder="Ingresa tu email">
														<span class="input-group-btn">
                                    <button class="btn" type="submit">Subscribirse Ahora</button>
                                </span>
												</div>
										</form>
								</div>
						</div>
				</div>
		</div>
</section>

