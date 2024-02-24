This document outlines the instructions and expectations for a data analysis exercise involving nursing homes.

**Overview**

This exercise simulates real-world analyses of nursing homes. I will utilize publicly available data from the Centers for Medicare & Medicaid Services (CMS) to analyze staffing trends and resident care metrics.

**Datasets**

* **CMS Nursing Home Staffing Data:** Quarterly report on staffing hours for various staff types (RN, LPN, CNA).
* **CMS Provider Information:** General information on nursing homes, including beds, quality scores, and staffing ratios.

**Instructions**

**Part 1: PBJ Data and Pivot Table**

1. Download Q2 2023 staffing data for specified states from the CMS website.
2. Import the data into a spreadsheet named "PBJ Data".
3. Generate a  table with the following specifications:
    * **Rows:** Unique combinations of provider and day.
    * **Values:** Sum of total and contract hours for RN, LPN, and CNA staff.
    * **Calculated Field:** "% of hours worked by contractors" as (contract hours / total hours) * 100, summed across staff types.
    * **Sort:** Highest to lowest % of contract hours.
    * **Output:** Tab with three columns: provnum, provname, % of contract hours.

**Part 2: Provider Summary**

1. Download the Provider Information dataset from the CMS website.
2. Create a new tab named "Provider Summary".
3. Add two new columns:
    * **Average Number of Residents per Day:** calculate this from the Provider Information data based on provnum (CMS ID).
    * **Reported RN Staffing Hours per Resident per Day:** Calculate this from the Provider Information data based on provnum (CMS ID).
5. Handle missing values gracefully if some nursing homes are not present in both datasets.

**Part 3: Additional Analyses**

1. **% Ctr RN Hours by Overall Rating:**
    * Create a new tab named "% Ctr RN Hours by Overall Rating".
    * Calculate the aggregated % of RN contract hours for each Overall Rating (1-5).
    * Filter out facilities without ratings.
    * Output a table with two columns: Overall Rating and % RN Hours worked by Contractor.
2. **CNA Hours by Affiliated Entity:**
    * Create a new tab named "CNA Hours by Affiliated Entity".
    * Calculate the sum of CNA contract hours for each Affiliated Entity in a specified state.
    * Sort by highest to lowest total contract hours.
    * Filter out entities with blank "Affiliated Entity Name" field.
    * Output a table with two columns: Affiliated Entity and CNA Contract Hours.

