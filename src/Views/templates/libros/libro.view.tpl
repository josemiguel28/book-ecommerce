<div class="container">		<div class="d-flex justify-content-center mb-5">				<h2 class="mb-4 text-xl font-bold text-gray-900 fs-3 text-capitalize">Información del libro</h2>		</div>		<div class="row d-flex justify-content-center">				<div class="col-md-10">						<div class="card">								<div class="row">										<div class="col-md-6">												<div class="images p-3 w-100">														<div class="text-center p-4 w-100">																<img id="main-image"																     class=" rounded-3"																     src="/{{~BASE_DIR}}/servidorImagenes/{{libroImagen}}"																     width="370"																     height="470"																     alt="{{libroNombre}}"/>														</div>												</div>										</div>										<div class="col-md-6">												<div class="product p-4">														<div class="d-flex justify-content-between align-items-center">																<div class="d-flex align-items-center">																																				<span class="ml-1"> 																				<a href="index.php?page=Libros_Catalogo"																				   class="text-decoration-none text-black">																						<i class="bi bi-arrow-left">&nbsp;</i>Regresar</a>																		</span>																</div>														</div>														<div class="mt-4 mb-3">																<div class="info-libro">																</div>																<h3 class="text-uppercase fw-normal fs-2">{{libroNombre}}</h3>																<div class="d-flex">																		<p class="fw-normal " style="color: #566787">{{libroAutor}}</p>																		<div class="d-flex mx-3 my-1">																				<i class="star fas fa-star text-warning mr-1"></i>																				<i class="star fas fa-star text-warning mr-1"></i>																				<i class="star fas fa-star text-warning mr-1"></i>																				<i class="star fas fa-star text-warning mr-1"></i>																				<i class="star fas fa-star text-warning"></i>																				<span class="badge badge-pill badge-gray ml-2" style="color: gray">4.7</span>																		</div>																</div>																<div class="price d-flex flex-row align-items-center">																		<span class="pe-3 fw-bold fs-4">L {{libroPrecio}}.00</span>																</div>														</div>														<span class="text-white px-1 rounded"														      style="font-size: 0.9rem;background-color: #4caf50"> 																				<i class="bi bi-box"></i> 																		Solo quedan {{stock}} en stock!																</span>														<span class="text-success small text-white px-1 rounded mx-3"														      style="font-size: 0.9rem;background-color: #003049">																<i class="bi bi-download"></i>																 Descarga Inmediata																</span>												</div>												<div class="info-libro mx-4">														<p>Descripcion del libro</p>														<p id="descripcion" class="fw-normal">{{libroDescripcion}}.</p>														<form action="index.php?page=Libros_Libro" method="post"														      class="d-flex flex-column w-75 mt-5">																<input type="hidden" name="libroId" value="{{libroId}}">																<input type="hidden" id="precio" name="precio" value="{{libroPrecio}}">																<label class="text-muted">Cantidad</label>																<div class="input-group mb-3 w-50">																		<button class="btn btn-outline-secondary" type="button" id="button-addon1"																		        onclick="decrement()">-																		</button>																		<input type="text" id="cantidad_seleccionada" name="cantidad"																		       class="form-control text-center" value="1" min="1">																		<button class="btn btn-outline-secondary" type="button" id="button-addon2"																		        onclick="increment()">+																		</button>																</div>																<button type="submit" class="btn btn-primary btn-block mt-4" {{noStock}}>Añadir al 																		Carrito																		&nbsp;<i class="bi-cart-fill me-3"></i>																</button>														</form>												</div>																						</div>								</div>						</div>				</div>		</div></div><!-- Section--><section class="py-5">		<div class="container">				<div class="d-flex justify-content-start mb-5">						<h2 class="mb-4 text-xl font-bold text-gray-900 fs-3">También te puede interesar</h2>				</div>								<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">						{{foreach libros}}						<div class="col mb-5">																<div class="card h-100">										<a href="index.php?page=Libros_Libro&id={{libroId}}" class="d-flex justify-content-center">												<img width="80%" height="300"												     src="/{{~BASE_DIR}}/servidorImagenes/{{libroImgUrl}}"												     class="text-center"												     alt="product-image"												>										</a>																			<div class="card-body p-4">											<div class="text-center mb-3">													<a href="index.php?page=Libros_Libro&id={{libroId}}"													   class="title text-decoration-none text-black fw-semibold text-uppercase">															{{libroNombre}}</a>													<p class="pt-2 fw-normal text-uppercase" style="color: #566787">{{libroAutor}}</p>													<!-- Product price-->													L {{libroPrecio}}											</div>												<span class="text-muted">Solo quedan <span class="text-decoration-underline">{{libroStock}}												</span> libros en stock</span>										</div>																				<div class="card-footer py-4 pt0 border-top-0 bg-transparent">												<div class="text-center">														<a href="index.php?page=Libros_Libro&id={{libroId}}"														   class="btn btn-outline-dark">Comprar</a>												</div>										</div>																</div>						</div>						{{endfor libros}}				</div>		</div></section><section class="newsletter mt-5">		<div class="container">				<div class="row">						<div class="col-sm-12">								<div class="content">										<form>												<h2>SUBSCRIBETE A NUESTRA NEWSLETTER</h2>												<div class="input-group">														<input type="email" class="form-control" placeholder="Ingresa tu email">														<span class="input-group-btn">                                    <button class="btn" type="submit">Subscribirse Ahora</button>                                </span>												</div>										</form>								</div>						</div>				</div>		</div></section><script>		function increment() {				let value = parseInt(document.getElementById('cantidad_seleccionada').value, 10);				value = isNaN(value) ? 0 : value;				value++;				document.getElementById('cantidad_seleccionada').value = value;		}		function decrement() {				let value = parseInt(document.getElementById('cantidad_seleccionada').value, 10);				value = isNaN(value) ? 0 : value;				value < 1 ? value = 1 : '';				value--;				document.getElementById('cantidad_seleccionada').value = value;		}</script>