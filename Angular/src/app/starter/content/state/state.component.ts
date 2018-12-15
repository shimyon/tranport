import { Component, OnInit } from "@angular/core";
import { FormControl, Validators } from "@angular/forms";

@Component({
  selector: "app-state",
  templateUrl: "./state.component.html",
  styleUrls: ["./state.component.css"]
})
export class StateComponent implements OnInit {
  control: FormControl;
  email: string;
  constructor() {
    this.email = "";
    this.control = new FormControl("", [Validators.email, Validators.min(10)]);
  }

  ngOnInit() {}
}
