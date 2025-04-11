<?php

include 'components/connect.php';

session_start();

if(isset($_SESSION['user_id'])){
   $user_id = $_SESSION['user_id'];
}else{
   $user_id = '';
};

include 'components/wishlist_cart.php';

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>home</title>
  
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Glide.js/3.4.1/css/glide.core.min.css">
   <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
   
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

   <link rel="stylesheet" href="css/style.css">

</head>
<body>
   
<?php include 'components/user_header.php'; ?>
	
<div class="slider">
		<div class="myslide fade">
			<div class="txt">
				<h1>Fashion Trending</h1>
				<p>New Summar<br>Collection 2023</p>
			</div>
			<img src="images/b11.jpg" style="width: 120%; height: 100%;">
		</div>
		
		<div class="myslide fade">
			<div class="txt">
           <h1>Fashion Trending</h1>
				<p>New Summar<br>Collection 2023</p>
			</div>
			<img src="images/b4.jpg" style="width: 100%; height: 100%;">
		</div>
		
		<div class="myslide fade">
			<div class="txt">
         <h1>Fashion Trending</h1>
			<p>New Summar<br>Collection 2023</p>
			</div>
			<img src="images/b10.jpg" style="width: 100%; height: 100%;">
		</div>
		
		<div class="myslide fade">
			<div class="txt">
         <h1>Fashion Trending</h1>
				<p>New Summar<br>Collection 2023</p>
			</div>
			<img src="images/b9.jpg" style="width: 100%; height: 100%;">
		</div>
		
		<div class="myslide fade">
			<div class="txt">
         <h1>Fashion Trending</h1>
			<p>New Summar<br>Collection 2023</p>
			</div>
			<img src="images/b8.jpg" style="width: 100%; height: 100%;">
		</div>

		<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
  		<a class="next" onclick="plusSlides(1)">&#10095;</a>
		
		<div class="dotsbox" style="text-align:center">
			<span class="dot" onclick="currentSlide(1)"></span>
			<span class="dot" onclick="currentSlide(2)"></span>
			<span class="dot" onclick="currentSlide(3)"></span>
			<span class="dot" onclick="currentSlide(4)"></span>
			<span class="dot" onclick="currentSlide(5)"></span>
		</div>
	</div>
   
<section class="banner">
    <div class="grid-banner">
        <div class="grid">
            <img src="images/men10.jpg" alt="">
            <div class="content">
                <span>Special Offer</span>
                <h3>Summer Collection</h3>
                <a href="shop.php" class="btn">order now</a>
            </div>
        </div>
        <div class="grid">
            <img src="images/s4.jpg" alt="">
            <div class="content center">
              <span>Special Offer</span>
                <h3>Summer Collection</h3>
                <a href="shop.php" class="btn">order now</a>
            </div>
        </div>
        <div class="grid">        
            <img src="images/s1.jpg" alt="">
            <div class="content">
               <span>Special Offer</span>
                <h3>Summer Collection</h3>
                <a href="shop.php" class="btn">order now</a>
            </div>
        </div>
    </div>

</section>
<section class="category">

  <h1><span>Shop By</span>Category</h1>

   <div class="swiper category-slider">

   <div class="swiper-wrapper">

   <a href="category.php?category=boy" class="swiper-slide slide">
      <img src="images/men10.jpg" alt="">
      <h3>Men</h3>
   </a>

   <a href="category.php?category=girl" class="swiper-slide slide">
      <img src="images/a1.jpg" alt="">
      <h3>Women</h3>
   </a>

   <a href="category.php?category=Bag" class="swiper-slide slide">
      <img src="images/a3.jpg" alt="">
      <h3>Bag</h3>
   </a>

   <a href="category.php?category=Sneaker" class="swiper-slide slide">
      <img src="images/sneaker.jpg" alt="">
      <h3>Shoe</h3>
   </a>

   <a href="category.php?category=Accessories" class="swiper-slide slide">
      <img src="images/ear1.jpg" alt="">
      <h3>Accessories</h3>
   </a>

   </div>

   <div class="swiper-pagination"></div>

   </div>

</section>


<section class="product">

<h1><span>New</span>Arrivals</h1>
   <div class="box-container">

   <?php
     $select_products = $conn->prepare("SELECT * FROM `products`"); 
     $select_products->execute();
     if($select_products->rowCount() > 0){
      while($fetch_product = $select_products->fetch(PDO::FETCH_ASSOC)){
   ?>
   <form action="" method="post" class="box">
      <input type="hidden" name="pid" value="<?= $fetch_product['id']; ?>">
      <input type="hidden" name="size" value="<?= $fetch_product['size']; ?>">
      <input type="hidden" name="name" value="<?= $fetch_product['name']; ?>">
      <input type="hidden" name="price" value="<?= $fetch_product['price']; ?>">
      <input type="hidden" name="image" value="<?= $fetch_product['image_01']; ?>">
      <button class="fas fa-heart" type="submit" name="add_to_wishlist"></button>
      <a href="quick_view.php?pid=<?= $fetch_product['id']; ?>" class="fas fa-eye"></a>
      <img src="uploaded_img/<?= $fetch_product['image_01']; ?>" alt="">
      <div class="name"><?= $fetch_product['name']; ?></div>
      <div class="flex">
         <div class="price"><span>$</span><?= $fetch_product['price']; ?><span>/-</span></div>
         <input type="number" name="qty" class="qty" min="1" max="99" onkeypress="if(this.value.length == 2) return false;" value="1">
      </div>
      <input type="submit" value="Add to cart" class="btn" name="add_to_cart">
   </form>
   <?php
      }
   }else{
      echo '<p class="empty">No products found!</p>';
   }
   ?>
   </div>

</section>

<section class="cta">
		<div class="cta-text">
			<h6>SUMMER ON SALE</h6>
			<h4>Fashion <br> NEW ARRIVAL</h4>
			<a href="shop.php" class="btn">SHOP NOW</a>
		</div>
</section>

<section class="home-products">

<h1><span>Latest</span>Products</h1>

   <div class="swiper products-slider">

   <div class="swiper-wrapper">

   <?php
     $select_products = $conn->prepare("SELECT * FROM `products` LIMIT 6"); 
     $select_products->execute();
     if($select_products->rowCount() > 0){
      while($fetch_product = $select_products->fetch(PDO::FETCH_ASSOC)){
   ?>
   <form action="" method="post" class="swiper-slide slide">
      <input type="hidden" name="pid" value="<?= $fetch_product['id']; ?>">
      <input type="hidden" name="name" value="<?= $fetch_product['name']; ?>">
      <input type="hidden" name="size" value="<?= $fetch_product['size']; ?>">
      <input type="hidden" name="price" value="<?= $fetch_product['price']; ?>">
      <input type="hidden" name="image" value="<?= $fetch_product['image_01']; ?>">
      <button class="fas fa-heart" type="submit" name="add_to_wishlist"></button>
      <a href="quick_view.php?pid=<?= $fetch_product['id']; ?>" class="fas fa-eye"></a>
      <img src="uploaded_img/<?= $fetch_product['image_01']; ?>" alt="">
      <div class="name"><?= $fetch_product['name']; ?></div>
      <div class="flex">
         <div class="price"><span>$</span><?= $fetch_product['price']; ?><span>/-</span></div>
         <input type="number" name="qty" class="qty" min="1" max="99" onkeypress="if(this.value.length == 2) return false;" value="1">
      </div>
      <input type="submit" value="Add to cart" class="btn" name="add_to_cart">
   </form>
   <?php
      }
   }else{
      echo '<p class="empty">No products added yet!</p>';
   }
   ?>

   </div>

   <div class="swiper-pagination"></div>

   </div>

</section>



<?php include 'blog.html'; ?>


<?php include 'components/footer.php'; ?>
<script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>

<script src="js/script.js"></script>

<script>
const myslide = document.querySelectorAll('.myslide'),
	  dot = document.querySelectorAll('.dot');
let counter = 1;
slidefun(counter);

let timer = setInterval(autoSlide, 8000);
function autoSlide() {
	counter += 1;
	slidefun(counter);
}
function plusSlides(n) {
	counter += n;
	slidefun(counter);
	resetTimer();
}
function currentSlide(n) {
	counter = n;
	slidefun(counter);
	resetTimer();
}
function resetTimer() {
	clearInterval(timer);
	timer = setInterval(autoSlide, 8000);
}

function slidefun(n) {
	
	let i;
	for(i = 0;i<myslide.length;i++){
		myslide[i].style.display = "none";
	}
	for(i = 0;i<dot.length;i++) {
		dot[i].className = dot[i].className.replace(' active', '');
	}
	if(n > myslide.length){
	   counter = 1;
	   }
	if(n < 1){
	   counter = myslide.length;
	   }
	myslide[counter - 1].style.display = "block";
	dot[counter - 1].className += " active";
}

 var swiper = new Swiper(".category-slider", {
   loop:true,
   spaceBetween: 20,
   pagination: {
      el: ".swiper-pagination",
      clickable:true,
   },
   breakpoints: {
      0: {
         slidesPerView: 2,
       },
      650: {
        slidesPerView: 3,
      },
      768: {
        slidesPerView: 4,
      },
      1024: {
        slidesPerView: 5,
      },
   },
});

var swiper = new Swiper(".products-slider", {
   loop:true,
   spaceBetween: 20,
   pagination: {
      el: ".swiper-pagination",
      clickable:true,
   },
   breakpoints: {
      550: {
        slidesPerView: 2,
      },
      768: {
        slidesPerView: 2,
      },
      1024: {
        slidesPerView: 3,
      },
   },
});


var swiper = new Swiper(".blogs-slider", {
  centeredSlides: true,
  loop:true,
  spaceBetween:20,
  autoplay: {
    delay: 9500,
    disableOnInteraction: false,
  },
  navigation: {
    nextEl: ".swiper-button-next",
    prevEl: ".swiper-button-prev",
  },
  breakpoints: {
    0: {
      slidesPerView: 1,
    },
    768: {
      slidesPerView: 2,
    },
    1200: {
      slidesPerView: 3,
    },
  },
});


</script>

</body>
</html>