import { Component } from '@angular/core';
import { SkillRepo } from '../../../../models/skill.repo';
import { Skill } from '../../../../models/skill.model';
import { SkillService } from '../../../../models/skill.service';
import { HttpClient } from '@angular/common/http';
import { EmployeeSkillService } from '../../../services/employee-skill.service';
import { MatDialog } from '@angular/material/dialog';
import { SkillData } from '../../../../models/SkillData.service';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-skill-display',
  templateUrl: './skill-display.component.html',
  styleUrl: './skill-display.component.css'
})
export class SkillDisplayComponent {
  newSkillName:string='';
  newSkillType:number=0;
  newSkillDescription:string='';
  accordionSubData: any[]=[];
  techinicalCategoryId: any;
  dialogRef: any;


  constructor(private http: HttpClient,private employeeSkillService:EmployeeSkillService,public dialog: MatDialog,private skillDataSevice: SkillData) {}
  ngOnInit(): void {
    // Load initial skill categories data
    this.saveSkill();
    this.skillDataSevice.accordionSubData$.subscribe(subData => {
      this.accordionSubData = subData;
      console.log('Sub-skills Data:', this.accordionSubData);
    });
  
  }
  saveSkill(){


    if (this.newSkillName.trim() !== '') {
      console.log('New sub skill category name:', this.newSkillName);

      console.log('Accordion Sub Data:', this.accordionSubData);
  
      const subselectedCategory = this.accordionSubData.find(category => category.techinicalCategoryId);
      const selectedCategory = this.accordionSubData.find(category => category.skillCategoryId);
      alert(subselectedCategory);
  
      if (subselectedCategory) {
        this.techinicalCategoryId = subselectedCategory.techinicalCategoryId;
        this.newSkillType=selectedCategory.skillCategoryId
        console.log('ReferenceTypeId:', this.techinicalCategoryId);
      } else {
        console.error('Selected category not found in accordion data');
        return; // Abort saving if selected category is not found
      }
  
      const skillBean: Skill = new Skill (
        this.newSkillName,
        this.techinicalCategoryId,
        this.newSkillType ,
        this.newSkillDescription,
        'Admin' //Need to get from login part  !!
      );
  
      console.log('SubSkillCategoryBean:', skillBean);
  
      this.employeeSkillService.subSkillAdmin(skillBean).subscribe(
        response => {
          Swal.fire({title:"Skill saved successfully",
          icon:"success"})
this.dialogRef.close();
        },
        error => {
          Swal.fire({title:"Skill already present",
          icon:"error"})
          this.dialogRef.close(); 
        }
      );
    } else {
      console.log('New sub skill category name is empty or not defined');
    }
  }
  
  }
  
  
  
