import { Component } from '@angular/core';
import { Router, RouterOutlet, RouterLink } from '@angular/router';
import { NgIf } from '@angular/common';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, RouterLink, NgIf],
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss'],
})
export class AppComponent {
  title = 'CodeingHub.UI';
  buttonText = 'click me';
  isHomePage = true;

  constructor(private router: Router) {
    this.router.events.subscribe(() => {
      this.isHomePage = this.router.url === '/';
    });
  }

  onButtonClick() {
    this.buttonText = 'clicked';
  }
}
