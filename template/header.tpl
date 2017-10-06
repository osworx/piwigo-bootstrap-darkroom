<!DOCTYPE html>
<html lang="{$lang_info.code}" dir="{$lang_info.direction}">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset={$CONTENT_ENCODING}">
    <meta name="generator" content="Piwigo (aka PWG), see piwigo.org">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
{if $meta_ref_enabled}
{if isset($INFO_AUTHOR)}
    <meta name="author" content="{$INFO_AUTHOR|@strip_tags:false|@replace:'"':' '}">
{/if}
{if isset($related_tags)}
    <meta name="keywords" content="{foreach from=$related_tags item=tag name=tag_loop}{if !$smarty.foreach.tag_loop.first}, {/if}{$tag.name}{/foreach}">
{/if}
{if isset($COMMENT_IMG)}
    <meta name="description" content="{$COMMENT_IMG|@strip_tags:false|@replace:'"':' '}{if isset($INFO_FILE)} - {$INFO_FILE}{/if}">
{else}
    <meta name="description" content="{$PAGE_TITLE}{if isset($INFO_FILE)} - {$INFO_FILE}{/if}">
{/if}
{/if}

    <title>{if $PAGE_TITLE!=l10n('Home') && $PAGE_TITLE!=$GALLERY_TITLE}{$PAGE_TITLE} | {/if}{$GALLERY_TITLE}</title>
    <link rel="shortcut icon" type="image/x-icon" href="{$ROOT_URL}{$themeconf.icon_dir}/favicon.ico">
    <link rel="icon" sizes="192x192" href="{$ROOT_URL}themes/bootstrap_darkroom/img/logo.png">
    <link rel="apple-touch-icon" sizes="192x192" href="{$ROOT_URL}themes/bootstrap_darkroom/img/logo.png">
    <link rel="start" title="{'Home'|@translate}" href="{$U_HOME}" >
    <link rel="search" title="{'Search'|@translate}" href="{$ROOT_URL}search.php">
{if isset($first.U_IMG)}
    <link rel="first" title="{'First'|@translate}" href="{$first.U_IMG}">
{/if}
{if isset($previous.U_IMG)}
    <link rel="prev" title="{'Previous'|@translate}" href="{$previous.U_IMG}">
{/if}
{if isset($next.U_IMG)}
    <link rel="next" title="{'Next'|@translate}" href="{$next.U_IMG}">
{/if}
{if isset($last.U_IMG)}
    <link rel="last" title="{'Last'|@translate}" href="{$last.U_IMG}">
{/if}
{if isset($U_UP)}
    <link rel="up" title="{'Thumbnails'|@translate}" href="{$U_UP}">
{/if}
{if isset($U_PREFETCH)}
    <link rel="prefetch" href="{$U_PREFETCH}">
{/if}
{if isset($U_CANONICAL)}
    <link rel="canonical" href="{$U_CANONICAL}">
{/if}
{if not empty($page_refresh)}
    <meta http-equiv="refresh" content="{$page_refresh.TIME};url={$page_refresh.U_REFRESH}">
{/if}

{strip}
{if $theme_config->bootstrap_theme == 'bootswatch'}
    {combine_css path="themes/bootstrap_darkroom/components/bootswatch/{$theme_config->bootswatch_theme}/bootstrap.min.css" order=-20}
{elseif $theme_config->bootstrap_theme == 'bootstrap-default'}
    {combine_css path='themes/bootstrap_darkroom/components/bootstrap/dist/css/bootstrap.min.css' order=-20}
    {combine_css path="themes/bootstrap_darkroom/components/typeface-roboto/index.css" order=-19}
{else}
    {combine_css path="themes/bootstrap_darkroom/css/{$theme_config->bootstrap_theme}/bootstrap.min.css" order=-20}
{/if}
{if $theme_config->bootstrap_theme == 'bootstrap-darkroom' || $theme_config->bootstrap_theme == 'material-darkroom'}
    {combine_css path="themes/bootstrap_darkroom/components/typeface-pt-sans/index.css" order=-19}
{elseif (0 === strpos($theme_config->bootstrap_theme, 'material'))}
    {combine_css path="themes/bootstrap_darkroom/components/typeface-roboto/index.css" order=-19}
{/if}
    {combine_css path='themes/bootstrap_darkroom/components/font-awesome/css/font-awesome.min.css' order=-14}
    {combine_css path='themes/bootstrap_darkroom/components/photography-icons/css/PhotographyIcons.css' order=-13}
{foreach from=$themes item=theme}
{if $theme.load_css}
    {combine_css path="themes/`$theme.id`/theme.css" order=-10}
{/if}
{if !empty($theme.local_head)}{include file=$theme.local_head load_css=$theme.load_css}{/if}
{/foreach}
{if file_exists("local/bootstrapdefault/custom.css")}
    {combine_css path="local/bootstrapdefault/custom.css" order=10000}
{/if}
{get_combined_css}
{if $BODY_ID == 'theAdditionalPage' || $BODY_ID == 'theHomePage' || $bootstrap_darkroom_core_js_in_header == true }
{assign var=loc value="header"}
{else}
{assign var=loc value="footer"} 
{/if}
{combine_script id='jquery' path='themes/bootstrap_darkroom/components/jquery/dist/jquery.min.js' load=$loc}
{combine_script id='jquery-migrate' require='jquery' path='themes/bootstrap_darkroom/components/jquery-migrate/dist/jquery-migrate.min.js' load=$loc}
{combine_script id='jquery.ajaxmanager' require='jquery' path='themes/default/js/plugins/jquery.ajaxmanager.js' load='footer'}
{combine_script id='thumbnails.loader' require='jquery.ajaxmanager' path='themes/default/js/thumbnails.loader.js' load='footer'}
{combine_script id='popper.js' require='jquery' path='themes/bootstrap_darkroom/components/popper.js/dist/umd/popper.min.js' load=$loc}
{if preg_match('/^material/', $theme_config->bootstrap_theme)}
    {combine_script id='bootstrap' require='popper.js' path='themes/bootstrap_darkroom/js/bootstrap-material-design.min.js' load=$loc}
{else}
    {combine_script id='bootstrap' require='popper.js' path='themes/bootstrap_darkroom/components/bootstrap/dist/js/bootstrap.min.js' load=$loc}
{/if}
{combine_script id=$themeconf.name require='bootstrap' path='themes/bootstrap_darkroom/js/theme.js' load='footer'}
{/strip}
{get_combined_scripts load='header'}
{if not empty($head_elements)}
    {foreach from=$head_elements item=elt}{$elt}
    {/foreach}
{/if}
</head>

<body id="{$BODY_ID}">
{if isset($MENUBAR)}
        <nav class="navbar navbar-expand-lg navbar-main {$theme_config->navbar_main_bg} {if $theme_config->page_header == 'fancy'}navbar-transparent fixed-top{else}{$theme_config->navbar_main_style}{/if}">
            <div class="container{if $theme_config->fluid_width}-fluid{/if}">
{if $theme_config->logo_image_enabled && $theme_config->logo_image_path !== ''}
                <a class="navbar-brand mr-auto" href="{$U_HOME}"><img class="img-fluid" src="{$ROOT_URL}{$theme_config->logo_image_path}" alt="{$GALLERY_TITLE}"/></a>
{else}
                <a class="navbar-brand mr-auto" href="{$U_HOME}">{$GALLERY_TITLE}</a>
{/if}
                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbar-menubar" aria-controls="navbar-menubar" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="fa fa-bars"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbar-menubar">
{if $theme_config->quicksearch_navbar}
                  <form class="form-inline navbar-form ml-auto" role="search" action="{$ROOT_URL}qsearch.php" method="get" id="quicksearch" onsubmit="return this.q.value!='' && this.q.value!=qsearch_prompt;">
                    <i class="fa fa-search" title="{'Search'|@translate}" aria-hidden="true"></i>
                    <div class="form-group">
                        <input type="text" name="q" id="qsearchInput" class="form-control" placeholder="{'Search'|@translate}" />
                    </div>
                  </form>
{footer_script require='jquery'}
var qsearch_icon = $('#navbar-menubar>#quicksearch>.fa-search');
var qsearch_text = $('#navbar-menubar>#quicksearch #qsearchInput');
$(qsearch_icon).click(function () {
  $(qsearch_text).focus();
});
$(document).ready(function() {
  $('#navbar-menubar>#quicksearch').css({literal}{'color': $('#navbar-menubar .nav-link').css('color')}{/literal});
});
{/footer_script}
{/if}
{$MENUBAR}
                </div>
            </div>
        </nav>
{if $theme_config->page_header == 'fancy'}
{footer_script require='jquery'}
var sfactor = $(".page-header").height() - 50;
{*var color = $('#fake-background').css('background-color');*}
var color = "rgba(0, 0, 0, 0)";
var nb_main_height = $('.navbar-main').outerHeight();
var nb_main_color;
var nb_cont_color;
$(window).resize(function(){
  sfactor = $(".page-header").height() -50;
});
$(window).scroll(function(){
  var alpha = 0 + ($(window).scrollTop() / sfactor);
  $('.page-header').attr('style', 'background-color: ' + setColorOpacity(color, alpha) + ' !important');
  $('.page-header .content-center').css('opacity', 1 - alpha * 2.5);
  $('.page-header .page-header-image').css('opacity', 1 - alpha);
  var top_offset = $(window).scrollTop();
  var p_size = $('.page-header').outerHeight() - $(".navbar-main").outerHeight() - $(".navbar-contextual").outerHeight();
  if (top_offset >= p_size) {
    $('.navbar-main').attr('style', 'background-color: ' + setColorOpacity(color, alpha*1.1) + ' !important');
    $('.navbar-contextual').attr('style', 'background-color: ' + setColorOpacity(color, alpha*2.1) + ' !important; top: ' + (nb_main_height - 1)  + 'px');
  } else {
    $('.navbar-main').attr('style', 'background-color:' + setColorOpacity(color, 0) + ' !important');
    $('.navbar-contextual').attr('style', 'background-color: ' + setColorOpacity(color, 0) + ' !important; top: 0');
  }
});
$('.navbar-main .navbar-collapse').on('show.bs.collapse', function() {
  nb_main_color = $('.navbar-main').css('background-color');
  $('.navbar-main').attr('style', 'background-color: rgba(0, 0, 0, 0.9) !important');
});
$('.navbar-main .navbar-collapse').on('hidden.bs.collapse', function() {
  $('.navbar-main').attr('style', 'background-color: ' + nb_main_color + ') !important');
});
$('.navbar-contextual .navbar-collapse').on('show.bs.collapse', function() {
  nb_cont_color = $('.navbar-contextual').css('background-color');
  $('.navbar-contextual.navbar-transparent').attr('style', 'background-color: rgba(0, 0, 0, 0.9) !important');
});
$('.navbar-contextual .navbar-collapse').on('hidden.bs.collapse', function() {
  $('.navbar-contextual.navbar-transparent').attr('style', 'background-color: ' + nb_cont_color + ') !important');
});
{/footer_script}
{/if}
{/if}

{if !isset($slideshow) && !empty($MENUBAR) && $theme_config->page_header != 'none'}
{if $theme_config->page_header == 'jumbotron'}
        <div class="jumbotron mb-0">
            <div class="container{if $theme_config->fluid_width}-fluid{/if}">
                <div id="theHeader">{$PAGE_BANNER}</div>
            </div>
        </div>
{else}
        <div class="page-header page-header-small mb-5">
            <div class="page-header-image" style="background-image: url({$theme_config->page_header_image}); transform: translate3d(0px, 0px, 0px);"></div>
            <div class="container d-flex">
                <div id="theHeader" class="content-center">
                    {$PAGE_BANNER}
                </div>
            </div>
        </div>
{footer_script require='jquery'}
  console.log(navigator.userAgent);
  $('.navbar-contextual').addClass('navbar-transparent navbar-sm');
{/footer_script}
{/if}
{/if}


{if not empty($header_msgs)}
{foreach from=$header_msgs item=msg}
{/foreach}
{/if}

{if not empty($header_notes)}
{foreach from=$header_notes item=note}
{/foreach}
{/if}

{include file='_plugin_fixes_js.tpl'}
<!-- End of header.tpl -->
