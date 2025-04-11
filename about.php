<?php

include 'components/connect.php';

session_start();

if(isset($_SESSION['user_id'])){
   $user_id = $_SESSION['user_id'];
}else{
   $user_id = '';
};

?>
<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>about</title>

   <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />

   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
   <link rel="stylesheet" href="css/style.css">

</head>
<body>
<?php include 'components/user_header.php'; ?>

<section class="about">

   <div class="row">

      <div class="image">
      <img src="images/blog1.png">
      </div>

      <div class="content">
      <h1><span>About</span>Us</h1>
                <h3>Why Choose us?</h3>
                <p>
                    Fashion Summary is a global fashion and lifestyle e-retailer committed to making the beauty of fashion accessible to all. 
                    We use on-demand manufacturing technology to connect suppliers to our agile supply chain, 
                    reducing inventory waste and enabling us to deliver a variety of affordable products to customers around the world.
                </p>
                
                <div class="about_services">

                    <div class="s_1">
                        <i class="fa-solid fa-truck-fast"></i>
                        <a href="#">Fast Delivery</a>
                    </div>

                    <div class="s_1">
                        <i class="fa-brands fa-amazon-pay"></i>
                        <a href="#">Easy Payment</a>
                    </div>

                    <div class="s_1">
                        <i class="fa-solid fa-headset"></i>
                        <a href="#">24 x 7 Services</a>
                    </div>

                </div>
                <a href="contact.php" class="about_btn">Contact Now</a>
      </div>

   </div>

</section>

<section class="gallery" id="gallery">

<h1><span>Fashion</span>Gallery</h1>

<div class="box-container">

    <div class="box" data-aos="fade-up">
        <img src="images/men7.jpg" alt="">
        <h3>Popular Fashion</h3>
    </div>

    <div class="box" data-aos="fade-up">
    <img src="images/women7.jpg" alt="">
        <h3>Popular Fashion</h3>
    </div>

    <div class="box" data-aos="fade-up">
    <img src="images/women3.jpg" alt="">
        <h3>Popular Fashion</h3>
    </div>

    <div class="box" data-aos="fade-up">
    <img src="images/men8.jpg" alt="">
        <h3>Popular Fashion</h3>
    </div>

    <div class="box" data-aos="fade-up">
    <img src="images/women5.jpg" alt="">
        <h3>Popular Fashion</h3>
    </div>

    <div class="box" data-aos="fade-up">
    <img src="images/men9.jpg" alt="">
        <h3>Popular Fashion</h3>
    </div>
    <div class="box" data-aos="fade-up">
    <img src="images/women8.jpg" alt="">
        <h3>Popular Fashion</h3>
    </div>

    <div class="box" data-aos="fade-up">
    <img src="images/men2.jpg" alt="">
        <h3>Popular Fashion</h3>
    </div>

    <div class="box" data-aos="fade-up">
    <img src="images/women9.jpg" alt="">
        <h3>Popular Fashion</h3>
    </div>
</div>

</section>

<section class="reviews" id="reviews">

   <h1 class="heading"> clients <span>reviews</span> </h1>

   <div class="review_box">
            <div class="review_card">

                <div class="review_profile">
                    <img src="images/pic1.jpg">
                </div>

                <div class="review_text">
                    <h2 class="name">Herry</h2>

                    <div class="review_icon">
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star-half-stroke"></i>
                    </div>

                    <div class="review_social">
                        <i class="fa-brands fa-facebook-f"></i>
                        <i class="fa-brands fa-instagram"></i>
                        <i class="fa-brands fa-twitter"></i>
                        <i class="fa-brands fa-linkedin-in"></i>
                    </div>

                    <p>
                    I recently bought a shirt from Fashion Summary, and I couldn't be more pleased with the convenience of online buying.
                     Finding the ideal item was simple thanks to their user-friendly website. I received my purchase quickly, and the checkout 
                     procedure went without a hitch. The shirt arrived in perfect condition and was true to the description on their website. 
                    Because of the excellent quality, I will most definitely return to Fashion Summary in the future. Strongly advised!
                    </p>

                </div>

            </div>

            <div class="review_card">

                <div class="review_profile">
                    <img src="images/pic2.jpg">
                </div>

                <div class="review_text">
                    <h2 class="name">David</h2>

                    <div class="review_icon">
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star-half-stroke"></i>
                    </div>

                    <div class="review_social">
                        <i class="fa-brands fa-facebook-f"></i>
                        <i class="fa-brands fa-instagram"></i>
                        <i class="fa-brands fa-twitter"></i>
                        <i class="fa-brands fa-linkedin-in"></i>
                    </div>

                    <p>
                    I recently purchased a sneaker from Fashion Summary, and I couldn’t be happier with my online shopping experience.
                     Their website was user-friendly, making it easy to find the perfect item. The checkout process was smooth, and 
                     I received my order promptly. The Sneaker arrived in excellent condition, exactly as described on their website. 
                    I’m thrilled with the quality and will definitely shop at Fashion Summary again in the future. Highly recommended!
                    </p>

                </div>

            </div>

            <div class="review_card">

                <div class="review_profile">
                    <img src="images/pic3.jpg">
                </div>

                <div class="review_text">
                    <h2 class="name">Jenny</h2>

                  
                    <div class="review_icon">
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star-half-stroke"></i>
                    </div>


                    <div class="review_social">
                        <i class="fa-brands fa-facebook-f"></i>
                        <i class="fa-brands fa-instagram"></i>
                        <i class="fa-brands fa-twitter"></i>
                        <i class="fa-brands fa-linkedin-in"></i>
                    </div>

                    <p>
                    I ordered a shirt from Fashion Summary last week, and I was amazed at how quickly it arrived. 
                    The packaging was secure, ensuring the item was undamaged. The customer service was exceptional, 
                    as they kept me updated throughout the entire process. 
                    I had a question about the product, and their support team responded promptly and professionally. 
                    Overall, my experience with Fashion Summary was outstanding, and I can’t wait for my next purchase.
                    </p>

                </div>

            </div>

            <div class="review_card">

                <div class="review_profile">
                    <img src="images/pic4.jpg">
                </div>

                <div class="review_text">
                    <h2 class="name">Emily</h2>

                    <div class="review_icon">
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star-half-stroke"></i>
                    </div>

                    <div class="review_social">
                        <i class="fa-brands fa-facebook-f"></i>
                        <i class="fa-brands fa-instagram"></i>
                        <i class="fa-brands fa-twitter"></i>
                        <i class="fa-brands fa-linkedin-in"></i>
                    </div>

                    <p>
                    I recently discovered Fashion Summary while searching for a specific girl wallet. Not only did they have the item I was looking for,
                    but their selection was vast, and the prices were competitive. The website was easy to navigate, and the product descriptions were informative and accurate. 
                    I was pleasantly surprised by the fast shipping and the care they took in packaging my order. 
                    I’m thrilled with my purchase and will continue to shop at Fashion Summary for all my wallet needs.
                    </p>

                </div>

            </div>

        </div>

    
   </div>

</section>
<?php include 'components/footer.php'; ?>

<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>

<script src="js/script.js"></script>

<script>

var swiper = new Swiper(".reviews-slider", {
   loop:true,
   spaceBetween: 20,
   pagination: {
      el: ".swiper-pagination",
      clickable:true,
   },
   breakpoints: {
      0: {
        slidesPerView:1,
      },
      768: {
        slidesPerView: 2,
      },
      991: {
        slidesPerView: 3,
      },
   },
});

</script>

</body>
</html>