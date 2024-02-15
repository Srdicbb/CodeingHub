import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ProofOfConceptComponent } from './proof-of-concept.component';

describe('ProofOfConceptComponent', () => {
  let component: ProofOfConceptComponent;
  let fixture: ComponentFixture<ProofOfConceptComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ProofOfConceptComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(ProofOfConceptComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
