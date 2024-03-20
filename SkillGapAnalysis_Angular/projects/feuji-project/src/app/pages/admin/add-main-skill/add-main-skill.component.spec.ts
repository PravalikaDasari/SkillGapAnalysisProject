import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AddMainSkillComponent } from './add-main-skill.component';

describe('AddMainSkillComponent', () => {
  let component: AddMainSkillComponent;
  let fixture: ComponentFixture<AddMainSkillComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [AddMainSkillComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(AddMainSkillComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
