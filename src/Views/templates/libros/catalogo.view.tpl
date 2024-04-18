<section class="container">		<div class="d-flex flex-column justify-content-center align-items-center mx-auto mb-5">				<span>Todos nuestros productos</span>				<p class="display-6 font-weight-bold">Navega por nuestros libros disponibles</p>		</div>		<section>				<div class="row">						<div class="col-12">								<div class="card border-light p-4">										{{foreach libros}}										<div class="row align-items-center mb-5">												<aside class="col-md-3 d-flex justify-content-center align-items-center">														<a href="#">																<img width="150" height="200"																     src="/{{~BASE_DIR}}/servidorImagenes/{{libroImgUrl}}"																     alt="product-image">														</a>												</aside> <!-- col.// -->												<div class="col-md-6">														<div class="info-main">																<a href="#" class="display-6 title text-decoration-none text-black text-hero-bold">{{libroNombre}}</a>																<div class="d-flex my-3">																		<i class="star fas fa-star text-warning mr-1"></i>																		<i class="star fas fa-star text-warning mr-1"></i>																		<i class="star fas fa-star text-warning mr-1"></i>																		<i class="star fas fa-star text-warning mr-1"></i>																		<i class="star fas fa-star text-warning"></i>																		<span class="badge badge-pill badge-gray ml-2">4.7</span>																		<span class="small text-success ml-3"><i class="fas fa-shopping-cart mr-1"></i>150 orders</span>																</div>																<span>{{libroDescripcion}}</span>														</div>																										</div>												<div class="d-flex flex-column col-12 col-md-3">														<div class="d-flex align-items-center justify-content-center flex-column">				                        <span name="precio" class="h5 mb-0 text-gray text-through mr-2 mb-3">				                            ${{libroPrecio}}				                        </span>																<span class="text-success small"><i																				class="fas fa-shipping-fast mr-1"></i>Descarga Inmediata</span>														</div> <!-- info-price-detail // -->														<div class="mt-4 d-flex align-items-center flex-column">																<a class="text-decoration-none text-decoration-underline text-black mb-3" href="#">																		Detalles																</a>																<form action="index.php?page=Libros_Catalogo" method="post" class="d-flex flex-column">																		<input type="hidden" name="libroId" value="{{libroId}}">																		<input type="hidden" id="precio" name="precio" value="{{libroPrecio}}">																		<label class="text-muted">Cantidad</label>																		<input type="number" name="cantidad" min="1" id="cantidad_seleccionada" value="1" class="">																		<button type="submit" class="btn btn-primary btn-block mt-4">Añadir al Carrito 																				&nbsp;<i																						class="bi-cart-fill me-3"></i>																		</button>																</form>														</div>												</div>										</div>										<hr>										{{endfor libros}}								</div>													</div>				</div>		</section></section>