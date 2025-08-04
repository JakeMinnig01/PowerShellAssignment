# PowerShellAssignment
## 📄 Description
This script (`MyApp.ps1`) reads a comma-separated values (CSV) file from disk and outputs **numeric**, **alphabetic**, or **both** types of values based on user input. It also supports **sorting** in either ascending or descending order.

This script was created as part of a technical assignment and demonstrates parameter handling, string parsing, filtering, sorting, and basic error handling in PowerShell.

---

## ▶️ How to Run

```powershell
.\MyApp.ps1 "<path-to-file>" "<valueType>" "<sortOrder>"
```

### 📥 Parameters

| Parameter     | Description                                                  | Valid Values                  |
|---------------|--------------------------------------------------------------|-------------------------------|
| `<path>`      | Path to the input CSV file                                   | e.g., `sample.txt`            |
| `<valueType>` | Type of data to extract from the file                        | `numeric`, `alpha`, `both`    |
| `<sortOrder>` | How to sort the extracted data                               | `ascending`, `descending`     |

---

## 💡 Examples

Given this input in `sample.txt`:

```
1,4,6,7,3,2,1.5,apple,banana,Zebra,Alpha
```

### Example 1:
```powershell
.\MyApp.ps1 "sample.txt" "numeric" "ascending"
```
**Output:**
```
1,1.5,2,3,4,6,7
```

### Example 2:
```powershell
.\MyApp.ps1 "sample.txt" "alpha" "descending"
```
**Output:**
```
Zebra,banana,apple,Alpha
```

---

##  Files Included

- `MyApp.ps1` – Main PowerShell script
- `sample.txt` – Sample input CSV file
- `output.txt` – Logged outputs from running different test cases

---

##  Author Notes

- Light error handling was added to check for invalid input paths and parameters.
- Values are validated using regex and sorted using built-in PowerShell commands.
- No extra features were added outside the assignment scope to maintain focus and clarity.

---

## Author
-Jake Minnig 
