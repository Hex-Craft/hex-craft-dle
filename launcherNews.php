<html>
    <head>
        <meta http-equiv="content-type" content="text/html" charset="utf-8">
        <title>Hex-Launcher</title>
        <style>
            @font-face {
              font-family: 'ProximaNova';
              src: url('/fonts/ProximaNova-Regular.eot?#iefix') format('embedded-opentype'),  url('/fonts/ProximaNova-Regular.ttf')  format('opentype'),
                     url('/fonts/ProximaNova-Regular.woff') format('woff'), url('/fonts/ProximaNova-Regular.ttf')  format('truetype'), url('/fonts/ProximaNova-Regular.svg#ProximaNova-Regular') format('svg');
              font-weight: normal;
              font-style: normal;
              font-display: fallback;
            }
            html, body, div, span, applet, object, iframe, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, h1, h2, h3, h4, h5, h6
            small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td,
            article, aside, canvas, details, embed,  figure, figcaption, footer, header, hgroup, menu, nav, output, ruby, section, summary, time, mark, audio, video {
                margin: 0;
                padding: 0;
                border: 0;
                font-family: 'ProximaNova', sans-serif;
                color: #828282;
                font-weight:300;
            }
            article, aside, details, figcaption, figure,
            footer, header, hgroup, menu, nav, section {
                display: block;
            }
            html {
                height: 100%;
            }
            body {
                line-height: 1;
            }
            .news-container {
                width:372px;
                background-color: #222;
                border: 5px solid #333;
                border-bottom: none;
            }
            .news-padding {
                padding: 5px;
            }
            hr {
                border: 1px solid #828282;
                margin: .25rem 0;
            }
        </style>
    </head>
    <body>
        <?php   $url = 'https://hex-craft.ru/index.php?mod=rss';
                $rss = simplexml_load_file($url)->channel->item;
                foreach ($rss as $item)
                    echo "  <div class='news-container'>
                                <div class='news-padding'>
                                    <h2> $item->title</h2>
                                    <hr>
                                    <h4>$item->description</h4>
                                </div>
                            </div>";  ?>
    </body>
</html>