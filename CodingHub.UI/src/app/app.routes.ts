import { Routes } from '@angular/router';


// Note: The `loadComponent` syntax is used for lazy loading components in Angular.
export const routes: Routes = [
  { path: '', loadComponent: () => import("./features/home/home.component").then(x => x.HomeComponent) },
  { path: 'nourishment', loadComponent: () => import("./features/nourishment/nourishment.component").then(x => x.NourishmentComponent) },
  { path: 'coding', loadComponent: () => import("./features/coding/coding.component").then(x => x.CodingComponent) },
  { path: 'wallet', loadComponent: () => import("./features/wallet/wallet.component").then(x => x.WalletComponent) },
  { path: '**', redirectTo: '' }
];


// sve komponente će biti deo glavnog bundle-a i učitavaju se odmah

// import { HomeComponent } from './features/home/home.component';
// import { NourishmentComponent } from './features/nourishment/nourishment.component';
// import { WalletComponent } from './features/wallet/wallet.component';
// import { CodingComponent } from './features/coding/coding.component';

// export const routes: Routes = [
//   { path: '', component: HomeComponent },
//   { path: 'nourishment', component: NourishmentComponent },
//   { path: 'wallet', component: WalletComponent },
//   { path: 'coding', component: CodingComponent },
//   { path: '**', redirectTo: '' }
// ];

/*

app/
├── core/                   # Jezgro aplikacije
│   ├── auth/               # Autentifikacija (ako postoji)
│   ├── interceptors/       # HTTP interceptori
│   └── core.module.ts      # Modul sa singleton servisima
│
├── shared/                 # Deljeni resursi
│   ├── ui/                 # UI komponente (buttons, cards...)
│   ├── pipes/              # Globalni pipe-ovi
│   └── shared.module.ts    # Modul za deljene stvari
│
├── features/               # Glavni feature moduli
│   ├── nutrition/          # Ishrana
│   │   ├── pages/          # Glavne stranice
│   │   ├── components/     # Manje komponente
│   │   ├── services/       # API komunikacija
│   │   ├── models/         # Tipovi podataka
│   │   ├── routes.ts       # Rute za ishranu
│   │   └── nutrition.module.ts
│   │
│   ├── finance/            # Finansije
│   ├── training/           # Trening
│   └── ...                 # Budući feature-i
│
├── app.component.ts        # Glavna komponenta
├── app.routes.ts           # Glavne rute (Lazy Loading)
└── app.module.ts           # Glavni modul (opcionalno)

*/

/*

// NgModel
// export const routes: Routes = [
//   { path: '', component: HomeComponent },
//   { path: 'wallet', component: WalletComponent },
//   {
//     path: 'nourishment',
//     component: NourishmentComponent,
//     //   children: [
//     //     { path: '', component: MenuComponent },
//     //     { path: 'breakfast', component: BreakfastComponent },
//     //     { path: 'lunch', component: LunchComponent },
//     //     { path: 'dinner', component: DinnerComponent },
//     //   ],
//   },
//   { path: '', redirectTo: '/home', pathMatch: 'full' },
// ];

*/