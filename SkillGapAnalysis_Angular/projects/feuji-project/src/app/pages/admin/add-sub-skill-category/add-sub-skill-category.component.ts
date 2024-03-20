import { Component, OnInit } from '@angular/core';
import { EmployeeSkillService } from '../../../services/employee-skill.service';
import { MatDialog } from '@angular/material/dialog';
import { SubSkillCategoryBean } from '../../../../models/SubSkillCategoryBean.model';
import { SubSkillData } from '../../../../models/SubSkillData.service';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-add-sub-skill-category',
  templateUrl: './add-sub-skill-category.component.html',
  styleUrl: './add-sub-skill-category.component.css'
})
export class AddSubSkillCategoryComponent implements OnInit {
  accordionData: any[] = []; // Initialize with  skill categories data structure
  accordionSubData: any[] = []; // Initialize with  sub-skills data structure
  panelOpenState: boolean = false;
  selectedSkillCategory: any;
  newSkillCategoryName: any;
  referenceTypeId: any;
  dialogRef: any;
  newSubSkillCategoryName:string='';

  constructor(private employeeSkillService: EmployeeSkillService,public dialog: MatDialog,private subSkillDataSevice: SubSkillData) {
    
  }
  

  ngOnInit(): void {
    
    this.subSkillDataSevice.accordionSubData$.subscribe(subData => {
      this.accordionSubData = subData;
      console.log('Sub-skills Data:', this.accordionSubData);
    });
  
  }

 
  saveSubSkillCategory() {
   

    if (this.newSubSkillCategoryName.trim() !== '') {
      console.log('New sub skill category name:', this.newSubSkillCategoryName);

      console.log('Accordion Sub Data:', this.accordionSubData);
  
      const subselectedCategory = this.accordionSubData.find(category => category.referenceTypeId);
     
  
      // if (subselectedCategory) {
      //   this.referenceTypeId = subselectedCategory.referenceTypeId;
      //   console.log('ReferenceTypeId:', this.referenceTypeId);
      // } else {
      //   console.error('Selected category not found in accordion data');
      //   return; // Abort saving if selected category is not found
      // }
  
      const subskillCategoryBean: SubSkillCategoryBean = new SubSkillCategoryBean(
        this.newSubSkillCategoryName,
        { referenceTypeId: this.referenceTypeId, referenceTypeName: this.newSubSkillCategoryName },
      );
  
      console.log('SubSkillCategoryBean:', subskillCategoryBean);
  
      this.employeeSkillService.saveSubSkillCategoryAdmin(subskillCategoryBean).subscribe(
        response => {
          
          Swal.fire({title:"Sub Skill category saved successfully",
                     icon:"success"})
         this.dialogRef.close();
        },
        error => {
          Swal.fire({title:"Sub Skill category already present",
          icon:"error"})
          this.dialogRef.close(); 
        }
      );
    } else {
      console.log('New sub skill category name is empty or not defined');
    }
  }
  
      
  }
  



