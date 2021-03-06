




<section class="promo">
    <h2 class="promo__title">Нужен стафф для катки?</h2>
    <p class="promo__text">На нашем интернет-аукционе ты найдёшь самое эксклюзивное сноубордическое и
        горнолыжное снаряжение.</p>
    <ul class="promo__list">
        <?php
        foreach ($result_categories as $category) {
            ?>
            <li class="promo__item promo__item--boards">
                <a class="promo__link" href="pages/all-lots.html"><?= $category['name'] ?></a>
            </li>
            <?php
        }
        ?>
    </ul>
</section>
<section class="lots">
    <div class="lots__header">
        <h2>Открытые лоты</h2>
    </div>
    <ul class="lots__list">
        <?php
        foreach ($result_lots as $lot) {
            ?>
            <li class="lots__item lot">
                <div class="lot__image">
                    <img src="<?= $lot['image'] ?>" width="350" height="260" alt="">
                </div>
                <div class="lot__info">
                    <span class="lot__category"><?= categories_name($result_categories, $lot['category_id']); ?></span>
                    <h3 class="lot__title"><a class="text-link"
                                              href="pages/lot.html"><?= $lot['name'] ?></a></h3>
                    <div class="lot__state">
                        <div class="lot__rate">

                            <span class="lot__amount">Стартовая цена</span>
                            <span class="lot__cost"><?= format_price($lot['start_price']) ?></span>
                        </div>
                        <div class="lot__timer timer <?php if (time_left($lot['creation_time'])[0] == 0) echo "timer--finishing"; ?>">
                            <?= time_left($lot['creation_time'])[0] ?>:<?= time_left($lot['creation_time'])[1] ?>
                        </div>
                    </div>
                </div>
            </li>
            <?php
        }
        ?>
    </ul>
</section>
