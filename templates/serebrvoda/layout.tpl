{* Основной шаблон *}
{strip}
{addmeta name="viewport" content="width=device-width, initial-scale=1.0"}
{addcss file="/rss-news/" basepath="root" rel="alternate" type="application/rss+xml" title="t('Новости')"}
{addcss file="reset.css"}
{addcss file="style.css?v=2"}

{addcss file="hover.css"}
{addcss file="style320.css"}
{addcss file="style768.css"}
{addcss file="style640.css"}
{addcss file="style480.css"}

{addjs file="jquery.tinycarousel.js"}

{addcss file="slick.css"}
{addjs file="slick.js"}

{addcss file="colorbox.css"}
{addjs file="html5shiv.js" unshift=true}
{addjs file="jquery.min.js" name="jquery" basepath="common" unshift=true}
{addjs file="jquery.autocomplete.js"}
{addjs file="jquery.activetabs.js"}
{addjs file="jquery.form.js" basepath="common"}
{addjs file="jquery.cookie.js" basepath="common"}
{addjs file="jquery.switcher.js"}
{addjs file="jquery.ajaxpagination.js"}
{addjs file="jquery.colorbox.js"}
{addjs file="jquery.scrollTo-min.js"}
{addjs file="modernizr.touch.js"}
{addjs file="modalEffects.js"}

{addjs file="classie.js"}
{addjs file="jquery.cookie.js"}

{addcss file="https://com23.ru/favicon.ico" basepath="root" rel="icon" type="image/x-icon"}


{addjs file="common.js"}
{addjs file="theme.js"}
{addmeta http-equiv="X-UA-Compatible" content="IE=Edge" unshift=true}
{assign var=shop_config value=ConfigLoader::byModule('shop')}
{if $shop_config===false}{$app->setBodyClass('shopBase', true)}{/if}


{$app->setDoctype('HTML')}
{/strip}
{$app->blocks->renderLayout()}

{* Подключаем файл scripts.tpl, если он существует в папке темы. В данном файле 
рекомендуется добавлять JavaScript код, который должен присутствовать на всех страницах сайта *}
{tryinclude file="%THEME%/scripts.tpl"}