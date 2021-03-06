{$shop_config=ConfigLoader::byModule('shop')}
{$config=ConfigLoader::byModule('mobilesiteapp')}
<ion-tabs>
  {hook name="mobilesiteapp-blockstabs:tabs" title="{t}Мобильное приложение - нижние вкладки: блок, нижние вкладки{/t}"}
    <ion-tab [root]="tabMain" tabTitle="Каталог" tabIcon="home"></ion-tab>
    {if $client_version>=1.2}
      <ion-tab [root]="tabMyOrders" tabTitle="Мои заказы" tabIcon="shirt" tabBadgeStyle="danger"></ion-tab>
    {/if}
    {*<ion-tab [root]="tabFavorite" tabTitle="Избранное" [tabBadge]="(favorite_count>0) ? favorite_count : null" tabIcon="heart" tabBadgeStyle="danger"></ion-tab>*}
    {if $shop_config && !$config.disable_buy}
      <ion-tab [root]="tabCart" tabTitle="Корзина" tabIcon="cart" [tabBadge]="(cart_count>0) ? cart_count : null" tabBadgeStyle="danger"></ion-tab>
    {/if}
  {/hook}
</ion-tabs>
