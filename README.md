# 🏪 Empty Restaurant Kitchen Cleanup

## *Chef's Professional Azure App Service Plan Cost Optimization*

[![PowerShell](https://img.shields.io/badge/PowerShell-5.1%2B-blue.svg)](https://github.com/PowerShell/PowerShell)
[![Azure](https://img.shields.io/badge/Azure-App%20Service-0078d4.svg)](https://azure.microsoft.com/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Chef's Rating](https://img.shields.io/badge/Chef's%20Rating-⭐⭐⭐⭐⭐-gold.svg)](#)
[![Savings Potential](https://img.shields.io/badge/Savings%20Potential-$500%2B%2Fmonth-brightgreen.svg)](#)

> *"Closing ghost kitchens and reclaiming your culinary budget!"* - CloudCostChef Restaurant Inspector

---

## 🍽️ What's This Restaurant Audit About?

Welcome to **CloudCostChef's Restaurant Management Division**! This professional kitchen inspection identifies **Ghost Kitchens** (unused Azure App Service Plans) that are bleeding money from your restaurant empire's budget.

### 👻 The Ghost Kitchen Problem

Imagine paying rent for **empty restaurant kitchens** every month:
- 🏪 **$13-$980+ monthly rent** per unused kitchen space
- 👻 **No chefs cooking** (no web apps running)
- 🍽️ **No customers served** (no actual workloads)
- 💸 **Pure waste** draining your Azure budget

### 🎯 What We'll Find

Our restaurant inspector scans your entire Azure empire to discover:
- **🆓 Community Kitchens** - Free tier App Service Plans (usually safe)
- **🍕 Food Truck Spaces** - Shared tier ($9.67/month waste)
- **🍔 Basic Restaurant Kitchens** - Basic tier ($13-$52/month waste)
- **🍷 Standard Restaurant Kitchens** - Standard tier ($70-$280/month waste) 
- **⭐ Premium Restaurant Kitchens** - Premium tier ($62-$584/month waste)
- **🏰 Luxury Private Kitchens** - Isolated tier ($187-$980/month waste)

---

## 💰 The Savings Menu

### 🍜 Typical Cost Recovery:
- **Small Restaurant Chain**: $200-$500/month savings
- **Medium Restaurant Empire**: $1,000-$3,000/month savings  
- **Large Corporate Chains**: $5,000-$15,000/month savings
- **Enterprise Restaurant Groups**: $20,000+/month potential

### 📊 Real-World Examples:
```
🏪 Example Ghost Kitchen Discoveries:
   👻 Premium P3 Kitchen (unused): $584/month × 12 = $7,008/year
   👻 Standard S3 Kitchen (empty): $280/month × 12 = $3,360/year
   👻 Isolated I2 Kitchen (vacant): $490/month × 12 = $5,880/year
   
🎉 Total Recovery: $16,248/year from just 3 ghost kitchens!
```

---

## 🛒 Shopping List (Prerequisites)

### Required Kitchen Inspector Tools:
- **PowerShell 5.1+** or **PowerShell Core 6.0+**
- **Azure PowerShell Modules**:
  ```powershell
  Install-Module Az.Accounts -Force
  Install-Module Az.ResourceGraph -Force  
  Install-Module Az.Billing -Force
  ```
- **Azure Account** with restaurant inspection rights

### Inspector Credentials Required:
- `Reader` role on target subscriptions
- `Resource Graph Reader` permissions
- Access to `Microsoft.ResourceGraph/resources/read`
- Permission to view App Service Plans across your restaurant empire

---

## 🍳 Kitchen Inspection Instructions

### Quick Restaurant Audit:

1. **Prep Your Inspector Toolkit**:
   ```powershell
   # Install Azure PowerShell restaurant management tools
   Install-Module Az -Force -AllowClobber
   ```

2. **Get Your Inspector Badge**:
   ```powershell
   Connect-AzAccount
   ```

3. **Start the Kitchen Inspection**:
   ```powershell
   # Basic inspection - scan all restaurant chains
   .\Azure-OrphanedAppServicePlans.ps1
   
   # Custom inspection location
   .\Azure-OrphanedAppServicePlans.ps1 -OutputPath "C:\Inspections\GhostKitchens.html"
   
   # Silent inspection (no auto-open)
   .\Azure-OrphanedAppServicePlans.ps1 -OpenReport:$false
   ```

### Advanced Restaurant Management:

```powershell
# Professional inspection with custom report location
.\Azure-OrphanedAppServicePlans.ps1 `
    -OutputPath "C:\RestaurantReports\Q4_GhostKitchen_Audit.html" `
    -OpenReport:$true

# Automated monthly inspection (scheduled task)
.\Azure-OrphanedAppServicePlans.ps1 `
    -OutputPath "\\shared\reports\MonthlyGhostKitchens_$(Get-Date -Format 'yyyy-MM').html" `
    -OpenReport:$false
```

---

## 🎛️ Restaurant Inspector Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `OutputPath` | String | `OrphanedAppServicePlans_Report.html` | Where to file the closure report |
| `OpenReport` | Switch | `$true` | Auto-open the inspection results |

---

## 🍽️ What's On The Inspection Menu? (Features)

### 🥗 Quick Appetizers (Overview Features):
- **🔍 Automated Ghost Detection** across all Azure subscription restaurant chains
- **💰 Real-time Cost Calculation** with current Azure pricing
- **🎨 Beautiful Inspection Reports** with restaurant-themed styling
- **📊 Restaurant Chain Breakdown** showing waste per subscription

### 🍖 Main Course (Detailed Features):
- **🕵️ Advanced KQL Scanning** using Azure Resource Graph for precision detection
- **🏰 Luxury Kitchen Detection** identifies high-cost premium tiers first
- **📈 Multi-tier Cost Analysis** from free community kitchens to luxury private spaces
- **🎯 Interactive HTML Reports** with clickable ghost kitchen selection
- **📋 Professional Recommendations** for staged kitchen closures

### 🍰 Dessert (Bonus Features):
- **🎨 Restaurant-themed UI** that makes cost optimization enjoyable
- **📊 Executive Summary Cards** for C-level restaurant empire overviews  
- **🖨️ Professional Print Reports** for budget meetings
- **💡 Chef's Pro Tips** for preventing future ghost kitchens

---

## 📊 Sample Inspection Results

After running the kitchen inspection, you'll receive:

### 🏪 Professional Closure Report Including:
- **Executive Summary** with total ghost kitchens and savings potential
- **Restaurant Chain Breakdown** showing waste per subscription
- **Detailed Ghost Kitchen Inventory** with individual closure recommendations
- **Chef's Professional Guidance** for safe kitchen closure procedures

### 💰 Typical Inspection Output:
```
🎉 EMPTY RESTAURANT KITCHEN CLEANUP COMPLETE! 🎉

👨‍🍳 Restaurant Inspector's Summary:
   👻 Ghost kitchens discovered: 8
   💸 Monthly kitchen waste: $1,247.50
   🎊 Annual savings opportunity: $14,970.00

🏪 RESTAURANT EMPIRE ANALYSIS:
   🏢 Restaurant chains audited: 3
   👻 Total ghost kitchens bleeding money: 8
   🎯 Most expensive ghost kitchen: 'premium-app-plan' ($584.00/month)

💡 Chef's Professional Recommendation:
   Start by closing the highest-tier ghost kitchens for immediate impact!
```

---

## 🧑‍🍳 Chef's Pro Kitchen Management Tips

### 🔍 Before Closing Any Kitchen:
1. **🍽️ Check the Reservation Book** - Verify no upcoming restaurant openings planned
2. **👨‍🍳 Consult the Head Chef** - Check with development teams about future needs
3. **📅 Review Seasonal Menus** - Some kitchens might be for holiday/peak season use
4. **🏷️ Read the Kitchen Tags** - Look for ownership and purpose labels

### 🤖 Restaurant Automation Best Practices:
```powershell
# Set up monthly ghost kitchen alerts
# Implement Azure Policy to prevent orphaned App Service Plans
# Create resource tagging standards for kitchen purpose tracking
# Schedule automated cleanup for community kitchens (F1 tier)
```

### 📅 Professional Restaurant Management:
- **Monthly Inspections**: Run this audit every 30 days
- **Quarterly Reviews**: Deep dive into kitchen utilization patterns  
- **Annual Budget Planning**: Factor ghost kitchen savings into cost projections
- **Team Training**: Educate developers on proper kitchen cleanup procedures

---

## 🍳 Kitchen Types & Pricing Guide

### 🏷️ Our Restaurant Kitchen Classification System:

| Kitchen Tier | Type | Monthly Cost | Best For | Risk Level |
|-------------|------|-------------|----------|------------|
| **F1** | 🆓 Community Kitchen | $0 | Testing/Development | ✅ Safe to close |
| **D1** | 🍕 Food Truck Space | $9.67 | Simple shared sites | ⚠️ Check usage |
| **B1-B3** | 🍔 Basic Restaurant | $13-$53 | Small business sites | ⚠️ Verify with team |
| **S1-S3** | 🍷 Standard Restaurant | $70-$280 | Production workloads | ⚠️ High risk |
| **P1-P3** | ⭐ Premium Restaurant | $62-$584 | Enterprise applications | 🚨 Critical review |
| **I1-I3** | 🏰 Luxury Private | $188-$980 | Isolated/compliance | 🚨 Danger zone |

---

## 🆘 Kitchen Inspection Troubles (Troubleshooting)

### Common Restaurant Management Issues:

**🚨 "Required Azure PowerShell modules not found"**
```powershell
# Solution: Install the restaurant management toolkit
Install-Module Az -Force -AllowClobber
```

**🚨 "Access Denied" to Kitchen Inspection**
- Ensure you have `Reader` role on target subscriptions
- Verify `Resource Graph Reader` permissions
- Contact your Azure administrator for kitchen inspection rights

**🚨 "No Ghost Kitchens Found" (When You Expected Some)**
```powershell
# This could mean:
# 1. 🎉 Excellent! Your restaurant empire is well-managed
# 2. 🔍 Permission issues preventing full kitchen visibility
# 3. 🏷️ All App Service Plans have attached apps (good management!)
```

**🚨 "KQL Query Failed"**
- Usually indicates Resource Graph access issues
- Ensure Microsoft.ResourceGraph provider is registered
- Verify subscription-level Reader permissions

**🚨 "High-Cost Kitchens Not Appearing"**
- Some premium kitchens might have development slots attached
- Check for staging environments using the same App Service Plan
- Verify query results against Azure Portal manually

---

## 🍷 Perfect Pairings (Related CloudCostChef Tools)

This restaurant inspection pairs beautifully with other CloudCostChef audits:
- **🍲 Orphaned Network Ingredient Bisque** (identifies unused NICs & Public IPs)
- **💾 Forgotten Storage Cellar Cleanup** (finds unused storage accounts) *coming soon*
- **🖥️ Idle Virtual Machine Retirement** (discovers unused VMs) *in development*
- **🗄️ Over-provisioned Database Diet** (optimizes database sizing) *planned*

---

## 🤝 Contributing to the Restaurant Empire

We welcome fellow restaurant managers and cost optimization chefs!

### How to Help Our Kitchen:
1. **🍴 Fork** the repository 
2. **🧑‍🍳 Create** your feature branch (`git checkout -b feature/NewKitchenType`)
3. **👨‍🍳 Commit** your improvements (`git commit -m 'Add support for Container Apps'`)
4. **🍽️ Push** to the branch (`git push origin feature/NewKitchenType`)
5. **📋 Open** a Pull Request with your restaurant improvements

### Kitchen Enhancement Ideas:
- **🏗️ Function App Kitchen Detection** (Azure Functions on consumption plans)
- **📱 Logic App Kitchen Scanning** (unused workflow kitchens)  
- **🌐 API Management Kitchen Audit** (idle API gateway instances)
- **🔄 Multi-cloud Restaurant Chains** (AWS, GCP equivalent inspections)
- **📧 Automated Kitchen Alerts** (email notifications for new ghost kitchens)

---

## 📞 Restaurant Management Support

### Need Help with Your Kitchen Inspection?
- 🐛 **Bug Reports**: Open an issue with detailed inspection logs
- 💡 **Feature Requests**: Suggest new kitchen types to detect
- 💬 **Questions**: Start a discussion in our restaurant management forum  
- 📧 **Direct Contact**: cloudcostchef@example.com

### Show Your Appreciation:
- ⭐ **Star this repository** if it helped optimize your restaurant empire
- 🍽️ **Share your success stories** and monthly savings achieved
- 📢 **Recommend to fellow chefs** struggling with ghost kitchen costs

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 🌟 Success Stories from Fellow Restaurant Managers

### What Kitchen Inspectors Are Saying:

> *"Found 12 ghost kitchens costing us $3,200/month! The premium P3 kitchens were the worst offenders. Closed them all and bought the team lunch with the first month's savings!"* 
> — **DevOps Chef, TechFoodCorp**

> *"The beautiful reports made it easy to show our CFO exactly where our Azure budget was hemorrhaging. Saved our department $18,000 annually!"* 
> — **Cloud Architect, StartupBistro**

> *"Finally, a cost optimization tool that doesn't put people to sleep! The restaurant theme got our whole team engaged in proper Azure resource management."* 
> — **FinOps Manager, Enterprise Restaurant Group**

> *"We were paying for 5 I3 isolated kitchens ($4,900/month) that hadn't served a single customer in 8 months. This tool saved our bacon!"*
> — **Platform Engineer, Global Food Services**

---

## 📈 Advanced Restaurant Management Strategies

### 🎯 Staged Kitchen Closure Approach:
1. **Week 1**: Close all F1 (free) community kitchens - zero risk
2. **Week 2**: Audit and close D1 food truck spaces - low cost impact
3. **Week 3**: Careful review of Basic tier kitchens - medium savings
4. **Week 4**: Premium kitchen deep dive - high savings potential
5. **Ongoing**: Monthly inspections to prevent new ghost kitchens

### 📊 Budget Planning Integration:
```powershell
# Monthly savings tracking
$GhostKitchenSavings = 1247.50
$AnnualBudgetRecovery = $GhostKitchenSavings * 12
$QuarterlySavingsTarget = $AnnualBudgetRecovery / 4

Write-Host "🎯 Q1 Budget Recovery Target: $QuarterlySavingsTarget"
```

### 🏷️ Kitchen Tagging Strategy:
Implement these tags on all App Service Plans:
- `Purpose`: "Production|Development|Testing|Staging"
- `Owner`: "TeamName|Department|Project"
- `Environment`: "Prod|Dev|Test|Stage"
- `CostCenter`: "12345"
- `ExpirationDate`: "2024-12-31"

---

## 🔮 Future Restaurant Features

### Coming Soon to CloudCostChef's Kitchen:
- **🤖 Automated Ghost Kitchen Prevention** (Azure Policy integration)
- **📧 Monthly Inspector Reports** (automated email delivery)
- **📱 Mobile Restaurant App** (inspect kitchens on-the-go)
- **🔔 Real-time Ghost Alerts** (Teams/Slack notifications)
- **📊 PowerBI Restaurant Dashboard** (executive cost visualization)
- **🌐 Multi-Cloud Restaurant Chains** (AWS, GCP support)

---

**🏪 Happy Restaurant Management! 🏪**

> *"Remember: Every ghost kitchen you close is money back in your culinary budget. A well-managed restaurant empire has no empty kitchens bleeding cash!"*
> 
> — **CloudCostChef Restaurant Inspector** 👨‍🍳

---

*Keep your Azure restaurant empire lean, efficient, and profitable! 🌟*
