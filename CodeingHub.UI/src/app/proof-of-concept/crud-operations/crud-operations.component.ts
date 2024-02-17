import { AfterViewInit, Component, OnInit, ViewChild } from '@angular/core';
import { MatPaginator } from '@angular/material/paginator';
import { MatTableDataSource } from '@angular/material/table';
import { CryptoCoinModule } from './models/crypto-coin.module';
import { CryptoCoinService } from './services/crypto-coin.service';
import { MatSort } from '@angular/material/sort';
import { MatDialog } from '@angular/material/dialog';
import { DialogComponent } from './dialog/dialog.component';

@Component({
  selector: 'app-crud-operations',
  templateUrl: './crud-operations.component.html',
  styleUrl: './crud-operations.component.css',
})
export class CrudOperationsComponent implements OnInit {
  displayedColumns: string[] = [
    'name',
    'price',
    'marketCap',
    'volume',
    'cirkularSuply',
    'symbol',
  ];
  dataSource!: MatTableDataSource<any>;

  @ViewChild(MatPaginator) paginator!: MatPaginator;
  @ViewChild(MatSort) sort!: MatSort;

  constructor(
    private _cryproCoinService: CryptoCoinService,
    public _dialog: MatDialog
  ) {}

  ngOnInit(): void {
    this.getCryptoCoinList();
  }

  getCryptoCoinList() {
    this._cryproCoinService.getCryptoCoinList().subscribe({
      next: (res) => {
        console.log(res);
        this.dataSource = new MatTableDataSource(res);
        this.dataSource.sort = this.sort;
        this.dataSource.paginator = this.paginator;
      },
      error: console.log,
    });
  }

  openDialog() {
    this._dialog.open(DialogComponent);
  }
}
// run in terminal to check if endpoint is working
// curl http://localhost:3000/cryptoCoin
