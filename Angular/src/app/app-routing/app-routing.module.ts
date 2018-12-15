import { AdminDashboard2Component } from "./../admin/admin-dashboard2/admin-dashboard2.component";
import { AdminDashboard1Component } from "./../admin/admin-dashboard1/admin-dashboard1.component";
import { StarterComponent } from "./../starter/starter.component";
import { AdminComponent } from "./../admin/admin.component";
import { NgModule } from "@angular/core";
import { CommonModule } from "@angular/common";
import { RouterModule } from "@angular/router";
import { StateComponent } from "../starter/content/state/state.component";
import { CityComponent } from "../starter/content/city/city.component";

@NgModule({
  imports: [
    RouterModule.forRoot([
      {
        path: "",
        redirectTo: "user",
        pathMatch: "full"
      },
      {
        path: "user",
        component: StarterComponent,
        children: [
          {
            path: "",
            redirectTo: "state",
            pathMatch: "full"
          },
          {
            path: "state",
            component: StateComponent
          },
          {
            path: "city",
            component: CityComponent
          }
        ]
      }
    ])
  ],
  declarations: [],
  exports: [RouterModule]
})
export class AppRoutingModule {}
