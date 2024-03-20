import { Component, OnInit } from '@angular/core';
import { EmployeeSkillService } from '../../../services/employee-skill.service';
import { MatDialogRef } from '@angular/material/dialog';
import { SkillCategoryBean } from '../../../../models/SkillCategoryBean.model';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-add-skill-category',
  templateUrl: './add-skill-category.component.html',
  styleUrls: ['./add-skill-category.component.css']
})
export class AddSkillCategoryComponent implements OnInit {
  newSkillCategoryName: any;
  referenceTypeId: number = 0;
  accordionData: any[] = [];

  constructor(private apiService: EmployeeSkillService, public dialogRef: MatDialogRef<AddSkillCategoryComponent>) { }

  ngOnInit(): void {
    this.fetchSkillCategories();
  }

  close(): void {
    this.dialogRef.close();
  }

  fetchSkillCategories(): void {
    this.apiService.getSkillCategoryNames().subscribe((data: any[]) => {
      this.accordionData = data;
      console.log('Skill Categories Data:', this.accordionData);
    });
  }

  saveSkillCategory(): void {
    if (this.newSkillCategoryName && this.newSkillCategoryName.trim() !== '') {
      console.log('New skill category name:', this.newSkillCategoryName);
  
      const selectedCategory = this.accordionData.find(category => category.referenceTypeId);
 
      if (selectedCategory) {
        this.referenceTypeId = selectedCategory.referenceTypeId;
        console.log('ReferenceTypeId:', this.referenceTypeId);
      } else {
        console.error('Selected category not found in accordion data');
        return; // Abort saving if selected category is not found
      }
  
      const skillCategoryBean: SkillCategoryBean = new SkillCategoryBean(
        this.newSkillCategoryName,
        { referenceTypeId: this.referenceTypeId, referenceTypeName: this.newSkillCategoryName },
        
        0,
        'Admin',
        ''
      );
  
      console.log('SkillCategoryBean:', skillCategoryBean);
  
      this.apiService.saveSkillCategoryAdmin(skillCategoryBean).subscribe(
        response => {
          Swal.fire({title:"Skill category saved successfully",
          icon:"success"})
this.dialogRef.close();
        },
        error => { 
           Swal.fire({title:"Skill category already present",
        icon:"error"})
        this.dialogRef.close(); 
        }
      );
    } else {
      console.log('New skill category name is empty or not defined');
    }
  }
  
  }
  

