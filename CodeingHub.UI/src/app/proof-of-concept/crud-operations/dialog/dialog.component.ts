import { Component, Inject, OnInit } from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';
import { CryptoCoinService } from '../services/crypto-coin.service';

@Component({
  selector: 'app-dialog',
  templateUrl: './dialog.component.html',
  styleUrl: './dialog.component.css',
})
export class DialogComponent implements OnInit {
  form: FormGroup;

  education: string[] = ['Matric', 'Diploma', 'Intermediate', 'Graduate'];

  constructor(
    private _formBuilder: FormBuilder,
    private _cryptoCoinService: CryptoCoinService,
    private _dialogRef: MatDialogRef<DialogComponent>,
    @Inject(MAT_DIALOG_DATA) public data: any //private _coreService: CoreService
  ) {
    this.form = this._formBuilder.group({
      firstName: '',
      lastName: '',
      email: '',
      dob: '',
      gender: '',
      education: '',
      company: '',
      experience: '',
      package: '',
    });
  }

  ngOnInit(): void {
    this.form.patchValue(this.data);
  }

  // onFormSubmit() {
  //   if (this.form.valid) {
  //     console.log(this.form.value);
  //   }
  // }

  onFormSubmit() {
    //   if (this.form.valid) {
    //     if (this.data) {
    //       this._cryptoCoinService
    //         .updateEmployee(this.data.id, this.form.value)
    //         .subscribe({
    //           next: (val: any) => {
    //             //this._coreService.openSnackBar('Employee detail updated!');
    //             this._dialogRef.close(true);
    //           },
    //           error: (err: any) => {
    //             console.error(err);
    //           },
    //         });
    //     } else {
    //       this._cryptoCoinService.addEmployee(this.form.value).subscribe({
    //         next: (val: any) => {
    //           //this._coreService.openSnackBar('Employee added successfully');
    //           this._dialogRef.close(true);
    //         },
    //         error: (err: any) => {
    //           console.error(err);
    //         },
    //       });
    //     }
    //   }
  }
}
