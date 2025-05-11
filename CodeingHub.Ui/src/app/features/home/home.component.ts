import { CommonModule } from "@angular/common";
import { Component } from "@angular/core";
import { Router, RouterModule, RouterOutlet } from "@angular/router";

@Component({
  selector: 'app-home',
  standalone: true,
  imports: [RouterOutlet, CommonModule, RouterModule],
  templateUrl: './home.component.html',
  styleUrl: './home.component.scss'
})
export class HomeComponent {
  constructor(private router: Router) {}

  goTo(path: string) {
    console.log("test")
    this.router.navigateByUrl('/coding');
    // this.router.navigate([path]);
  }

  // goTo(route: string) {
  //   this.router.navigate([`/${route}`]);
  // }

}
