<?php

use App\Models\Slider;

$slider = new Slider();
$args = array(
  'status' => 1,
  'position' => 'slideshow',
  'order' => array('field' => 'orders', 'orderby' => 'ASC')

);
$list_slider = $slider->slider_list($args);
?>

<div class="slider" style="min-height:auto; margin: 1em 0 1em 0;">
  <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-inner">
      <?php $index = 1; ?>
      <?php foreach ($list_slider as $slider_row) : ?>
        <?php if ($index == 1) : ?>
          <div class="carousel-item active" style="min-width: 61em; min-height:33em;">
            <a href="<?php echo $slider_row['link']; ?>">
              <img id="imgslider" style="width: 61em; height:33em;" src="public/images/sliders/<?php echo $slider_row['image']; ?>" class="d-block" alt="<?php echo $slider_row['image']; ?>">
            </a>
          </div>
        <?php else : ?>
          <div class="carousel-item">
            <a href="<?php echo $slider_row['link']; ?>">
              <img id="imgslider" style="width: 61em; height:33em;" src="public/images/sliders/<?php echo $slider_row['image']; ?>" class="d-block" alt="<?php echo $slider_row['image']; ?>">
            </a>
          </div>
        <?php endif; ?>
        <?php $index++; ?>
      <?php endforeach; ?>
      <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
      </button>
      <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
      </button>
    </div>
  </div>
</div>