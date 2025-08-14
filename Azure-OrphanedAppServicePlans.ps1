# ===============================================================================
# 🏪 EMPTY RESTAURANT KITCHEN CLEANUP 🏪
# ===============================================================================
# Chef's Special: A thorough inspection of vacant restaurant kitchens (App Service Plans)
# that are sitting empty but still charging rent! Time to close down these 
# ghost kitchens and reclaim your hard-earned culinary budget.
#
# This recipe serves: All Azure subscription restaurant chains
# Prep time: 1-2 minutes | Cook time: 30 seconds - 1 minute  
# Difficulty: Beginner-Intermediate | Cuisine: Cloud Cost Optimization
# Savings Potential: HIGH (Premium kitchens can cost $500+ per month!)
# ===============================================================================

# 🔧 RESTAURANT MANAGER'S SETTINGS - Customize Your Kitchen Audit
param(
    [string]$OutputPath = "OrphanedAppServicePlans_Report.html",     # Where to file the closure report
    [switch]$OpenReport = $true                                      # Auto-open the restaurant inspection results
)

# 🛠️ KITCHEN INSPECTOR TOOLS - Import Essential Restaurant Management Modules
# Every good restaurant inspector needs proper credentials and tools!
Write-Host "🔍 Preparing kitchen inspection toolkit..." -ForegroundColor Yellow

try {
    # Our essential restaurant management utilities
    Import-Module Az.Accounts -Force      # Master key to all restaurant chains
    Import-Module Az.ResourceGraph -Force # The all-seeing kitchen scanner
    Import-Module Az.Billing -Force       # The cost accountant's calculator
    
    Write-Host "✅ Inspector toolkit ready! Time to audit those kitchens..." -ForegroundColor Green
} catch {
    Write-Error "🚨 Kitchen inspection toolkit missing! Please install with: Install-Module Az"
    Write-Host "💡 Inspector's Tip: Run 'Install-Module Az' to get your restaurant management license!" -ForegroundColor Red
    exit 1
}

# 🗝️ RESTAURANT CHAIN ACCESS - Ensure Inspector Has Master Keys
# No inspector can audit restaurants without proper credentials!
if (-not (Get-AzContext)) {
    Write-Host "🗝️  Unlocking restaurant chain master access..." -ForegroundColor Yellow
    Write-Host "👨‍🍳 Please provide your restaurant inspector credentials..." -ForegroundColor Cyan
    Connect-AzAccount
}

Write-Host "🏪 Beginning the Great Empty Restaurant Kitchen Cleanup..." -ForegroundColor Green
Write-Host "🔍 Scanning for vacant kitchens that are bleeding money..." -ForegroundColor Cyan

# 🕵️ THE GHOST KITCHEN DETECTOR - Our Secret Restaurant Inspector Formula
# This KQL query is like having X-ray vision to see through restaurant walls!
# We're looking for App Service Plans (restaurant kitchens) with no apps (dishes being cooked)

$kqlQuery = @'
// 🏪 GHOST KITCHEN DETECTION RECIPE 🏪
// Find restaurant kitchens (App Service Plans) with no chefs or dishes (Web Apps/Function Apps)
// These are the money-draining ghost kitchens we need to shut down!

Resources
| where type == "microsoft.web/serverfarms"    // All the restaurant kitchen leases
| project 
    AppServicePlanName = tostring(name),        // Kitchen name on the lease
    ResourceGroup = tostring(resourceGroup),    // Restaurant district location  
    Location = tostring(location),              // City where kitchen sits empty
    SubscriptionId = tostring(subscriptionId),  // Restaurant chain ID
    PricingTier = tostring(sku.name),          // Kitchen size and luxury level
    Capacity = toint(sku.capacity),            // Number of cooking stations
    Kind = tostring(kind),                     // Type of kitchen (Windows/Linux)
    Status = tostring(properties.status),      // Is the kitchen even running?
    ResourceId = tolower(tostring(id))         // Unique kitchen identifier
| join kind=leftouter (
    Resources
    | where type in ("microsoft.web/sites", "microsoft.web/sites/slots")  // All the restaurants and food trucks
    | where isnotempty(properties.serverFarmId)                           // That actually have a kitchen
    | project AppServicePlanId = tolower(tostring(properties.serverFarmId)) // Which kitchen they're using
    | distinct AppServicePlanId                                             // Remove duplicates
) on $left.ResourceId == $right.AppServicePlanId                         // Match kitchens to restaurants
| where isempty(AppServicePlanId)                                        // Find kitchens with NO restaurants!
| project-away AppServicePlanId                                          // Clean up the results
| order by PricingTier desc, AppServicePlanName asc                      // Show most expensive waste first
'@

# 🔬 KITCHEN INSPECTION EXECUTION - Deploy Our Ghost Kitchen Scanner
try {
    Write-Host "🔬 Deploying advanced ghost kitchen detection scanners..." -ForegroundColor Yellow
    Write-Host "📡 Scanning all restaurant chains for empty kitchens..." -ForegroundColor Cyan
    
    $orphanedPlans = Search-AzGraph -Query $kqlQuery -First 1000
    
    if ($orphanedPlans.Count -eq 0) {
        Write-Host "🎉 Congratulations! No ghost kitchens found - your restaurant empire is lean and mean!" -ForegroundColor Green
    } else {
        Write-Host "👻 Found $($orphanedPlans.Count) ghost kitchens draining your budget!" -ForegroundColor Red
        Write-Host "💰 Let's calculate how much these empty kitchens are costing you..." -ForegroundColor Yellow
    }
} catch {
    Write-Error "🚨 Kitchen scanner malfunction: $($_.Exception.Message)"
    Write-Host "🔧 Please check your restaurant inspector credentials and try again!" -ForegroundColor Red
    exit 1
}

# 📚 RESTAURANT CHAIN DIRECTORY - Build Our Subscription Registry
Write-Host "📚 Building restaurant chain directory..." -ForegroundColor Cyan
$subscriptions = @{}
Get-AzSubscription | ForEach-Object {
    $subscriptions[$_.Id] = $_.Name
    Write-Host "   🏪 Registered: $($_.Name)" -ForegroundColor Gray
}

# 💰 KITCHEN RENT CALCULATOR - What These Empty Kitchens Are Costing
# Every restaurant manager needs to know their overhead costs!
Write-Host "💰 Loading current kitchen rental rates..." -ForegroundColor Yellow

# 🏷️ RESTAURANT KITCHEN PRICING MENU (Monthly Rent in USD)
# From food truck spaces to Michelin-star kitchen facilities
$pricingTiers = @{
    'F1'    = 0         # 🆓 Community kitchen (Free tier)
    'D1'    = 9.67      # 🍕 Food truck shared space (Shared)
    'B1'    = 13.14     # 🍔 Basic burger joint kitchen (Basic B1)
    'B2'    = 26.28     # 🍝 Family restaurant kitchen (Basic B2)  
    'B3'    = 52.56     # 🥘 Full-service restaurant kitchen (Basic B3)
    'S1'    = 70.08     # 🍷 Wine bar kitchen (Standard S1)
    'S2'    = 148.16    # 🥩 Steakhouse kitchen (Standard S2)
    'S3'    = 280.32    # 🦞 High-end seafood kitchen (Standard S3)
    'P1'    = 146.00    # ⭐ Boutique restaurant kitchen (Premium P1)
    'P2'    = 292.00    # ⭐⭐ Upscale dining kitchen (Premium P2)
    'P3'    = 584.00    # ⭐⭐⭐ Michelin-star kitchen (Premium P3)
    'P1v2'  = 73.00     # ⭐ Modern boutique kitchen v2 (Premium P1v2)
    'P2v2'  = 146.00    # ⭐⭐ Contemporary fine dining v2 (Premium P2v2)
    'P3v2'  = 292.00    # ⭐⭐⭐ Ultra-modern luxury kitchen v2 (Premium P3v2)
    'P1v3'  = 62.05     # ⭐ Next-gen efficient kitchen v3 (Premium P1v3)
    'P2v3'  = 124.10    # ⭐⭐ Advanced culinary space v3 (Premium P2v3)
    'P3v3'  = 248.20    # ⭐⭐⭐ Elite chef's laboratory v3 (Premium P3v3)
    'I1'    = 245.00    # 🏰 Private estate kitchen (Isolated I1)
    'I2'    = 490.00    # 🏰 Luxury resort kitchen (Isolated I2)  
    'I3'    = 980.00    # 🏰 5-star hotel main kitchen (Isolated I3)
    'I1v2'  = 187.77    # 🏰 Boutique hotel kitchen v2 (Isolated I1v2)
    'I2v2'  = 375.54    # 🏰 Grand hotel kitchen v2 (Isolated I2v2)
    'I3v2'  = 751.08    # 🏰 Presidential suite kitchen v2 (Isolated I3v2)
    'WS1'   = 168       # 🔄 Catering workflow kitchen (Workflow Standard)
}

Write-Host "📊 Kitchen rental rates loaded - from free community spaces to $980/month luxury suites!" -ForegroundColor Green

# 🧮 COST CALCULATION KITCHEN - Where We Count the Wasted Dollars
Write-Host "🧮 Calculating monthly waste from empty restaurant kitchens..." -ForegroundColor Yellow

$results = @()
$totalMonthlySavings = 0
$subscriptionSummary = @{}

# 🔍 INSPECT EACH GHOST KITCHEN - Calculate Individual Waste
foreach ($plan in $orphanedPlans) {
    # 💸 Get the base rental cost for this kitchen tier
    $baseCost = if ($pricingTiers.ContainsKey($plan.PricingTier)) { 
        $pricingTiers[$plan.PricingTier] 
    } else { 
        Write-Host "⚠️  Unknown kitchen tier '$($plan.PricingTier)' - assuming premium rates!" -ForegroundColor Yellow
        100  # Default to $100 for unknown tiers
    }
    
    # 🏭 Calculate total cost considering capacity (multiple cooking stations)
    # If you lease 3 cooking stations, you pay for 3 cooking stations!
    $monthlyCost = $baseCost * [Math]::Max($plan.Capacity, 1)
    $totalMonthlySavings += $monthlyCost
    
    # 🏪 Get the restaurant chain name (subscription)
    $subscriptionName = if ($subscriptions.ContainsKey($plan.SubscriptionId)) { 
        $subscriptions[$plan.SubscriptionId] 
    } else { 
        Write-Host "🤷‍♂️ Unknown restaurant chain: $($plan.SubscriptionId)" -ForegroundColor Yellow
        "Unknown Restaurant Chain" 
    }
    
    # 📊 Update restaurant chain summary ledger
    if (-not $subscriptionSummary.ContainsKey($plan.SubscriptionId)) {
        $subscriptionSummary[$plan.SubscriptionId] = @{
            Name = $subscriptionName
            Count = 0
            MonthlySavings = 0
        }
    }
    $subscriptionSummary[$plan.SubscriptionId].Count++
    $subscriptionSummary[$plan.SubscriptionId].MonthlySavings += $monthlyCost
    
    # 🗃️ Add this ghost kitchen to our closure list
    $results += [PSCustomObject]@{
        SubscriptionName = $subscriptionName
        SubscriptionId = $plan.SubscriptionId
        AppServicePlanName = $plan.AppServicePlanName
        ResourceGroup = $plan.ResourceGroup
        Location = $plan.Location
        PricingTier = $plan.PricingTier
        Capacity = $plan.Capacity
        Kind = $plan.Kind
        Status = $plan.Status
        EstimatedMonthlyCost = $monthlyCost
        EstimatedAnnualCost = $monthlyCost * 12
    }
    
    # 🎯 Log each discovery for the chef's inspection notes
    $kitchenType = switch ($plan.PricingTier) {
        'F1' { "🆓 Community Kitchen" }
        {$_ -like 'D*'} { "🍕 Food Truck Space" }
        {$_ -like 'B*'} { "🍔 Basic Restaurant Kitchen" }
        {$_ -like 'S*'} { "🍷 Standard Restaurant Kitchen" }
        {$_ -like 'P*'} { "⭐ Premium Restaurant Kitchen" }
        {$_ -like 'I*'} { "🏰 Luxury Private Kitchen" }
        {$_ -like 'WS*'} { "🔄 Workflow Kitchen" }
        default { "🤷‍♂️ Mystery Kitchen" }
    }
    
    Write-Host "   👻 Found: $($plan.AppServicePlanName) - $kitchenType - Bleeding `$$($monthlyCost.ToString('F2'))/month" -ForegroundColor Red
}

# 📄 GENERATE THE CLOSURE REPORT - Create Beautiful Restaurant Inspection Document
Write-Host "📄 Preparing comprehensive restaurant kitchen closure report..." -ForegroundColor Yellow
Write-Host "🎨 Adding chef-quality presentation styling..." -ForegroundColor Cyan

# 🎭 THE GRAND REPORT CREATION - Begin HTML Masterpiece
$htmlContent = @"
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>🏪 Empty Restaurant Kitchen Cleanup - Cost Optimization Report</title>
    <style>
        /* 🎨 Chef's Signature Restaurant Inspection Styling */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 20px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            background-attachment: fixed;
            min-height: 100vh;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            background-color: white;
            border-radius: 15px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.3);
            overflow: hidden;
            border: 3px solid #ff6b6b;
        }
        .header {
            background: linear-gradient(135deg, #ff9a9e 0%, #fecfef 50%, #fecfef 100%);
            color: #2c3e50;
            padding: 40px;
            text-align: center;
            position: relative;
            overflow: hidden;
        }
        .header::before {
            content: "🏪";
            position: absolute;
            top: 15px;
            right: 30px;
            font-size: 4em;
            opacity: 0.3;
        }
        .header::after {
            content: "👻";
            position: absolute;
            top: 15px;
            left: 30px;
            font-size: 4em;
            opacity: 0.3;
        }
        .header h1 {
            margin: 0;
            font-size: 3em;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
            background: linear-gradient(45deg, #667eea, #764ba2);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }
        .header p {
            margin: 15px 0 0 0;
            opacity: 0.8;
            font-size: 1.2em;
            font-weight: 500;
        }
        .chef-subtitle {
            font-style: italic;
            color: #e74c3c;
            font-weight: bold;
            margin-top: 10px;
        }
        .summary {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 25px;
            padding: 40px;
            background: linear-gradient(135deg, #a8edea 0%, #fed6e3 100%);
        }
        .summary-card {
            background: linear-gradient(135deg, #ffeaa7 0%, #fab1a0 100%);
            padding: 25px;
            border-radius: 15px;
            box-shadow: 0 8px 16px rgba(0,0,0,0.2);
            text-align: center;
            position: relative;
            border: 2px solid #e17055;
            transition: transform 0.3s ease;
        }
        .summary-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 25px rgba(0,0,0,0.3);
        }
        .summary-card::before {
            content: "";
            position: absolute;
            top: -50%;
            right: -50%;
            width: 100%;
            height: 100%;
            background: radial-gradient(circle, rgba(255,255,255,0.4) 0%, transparent 70%);
            transform: rotate(45deg);
        }
        .summary-card h3 {
            margin: 0 0 15px 0;
            color: #2c3e50;
            font-size: 1.2em;
            font-weight: bold;
        }
        .summary-card .value {
            font-size: 2.8em;
            font-weight: bold;
            color: #e74c3c;
            text-shadow: 1px 1px 2px rgba(0,0,0,0.2);
            margin-bottom: 10px;
        }
        .summary-card.savings .value {
            color: #27ae60;
        }
        .summary-card .description {
            color: #2c3e50;
            font-weight: 500;
            opacity: 0.8;
        }
        .content {
            padding: 40px;
        }
        .section {
            margin-bottom: 50px;
        }
        .section h2 {
            color: #2c3e50;
            border-bottom: 4px solid #ff6b6b;
            padding-bottom: 15px;
            font-size: 1.8em;
            margin-bottom: 25px;
            position: relative;
        }
        .section h2::before {
            content: "📊";
            margin-right: 10px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 25px;
            background: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 8px 16px rgba(0,0,0,0.15);
            border: 2px solid #ddd;
        }
        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #eee;
        }
        th {
            background: linear-gradient(135deg, #74b9ff 0%, #0984e3 100%);
            font-weight: bold;
            color: white;
            text-transform: uppercase;
            letter-spacing: 1px;
            font-size: 0.9em;
        }
        tr:nth-child(even) {
            background: linear-gradient(135deg, #dfe6e9 0%, #b2bec3 100%);
        }
        tr:hover {
            background: linear-gradient(135deg, #fdcb6e 0%, #e17055 100%);
            color: white;
            transform: scale(1.02);
            transition: all 0.3s ease;
            cursor: pointer;
        }
        .cost {
            font-weight: bold;
            color: #27ae60;
            font-size: 1.1em;
        }
        .tier {
            font-weight: bold;
            padding: 6px 12px;
            border-radius: 20px;
            background: linear-gradient(135deg, #74b9ff 0%, #0984e3 100%);
            color: white;
            font-size: 0.9em;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        .footer {
            text-align: center;
            padding: 30px;
            background: linear-gradient(135deg, #636e72 0%, #2d3436 100%);
            color: white;
            font-size: 1em;
        }
        .footer strong {
            color: #fdcb6e;
        }
        .export-btn {
            background: linear-gradient(135deg, #00b894 0%, #00cec9 100%);
            color: white;
            border: none;
            padding: 15px 30px;
            border-radius: 25px;
            cursor: pointer;
            margin: 15px;
            font-weight: bold;
            font-size: 1em;
            transition: all 0.3s ease;
            box-shadow: 0 6px 15px rgba(0,0,0,0.2);
        }
        .export-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 25px rgba(0,0,0,0.3);
            background: linear-gradient(135deg, #00a085 0%, #00b2a9 100%);
        }
        .warning-box {
            background: linear-gradient(135deg, #ffeaa7 0%, #fab1a0 100%);
            border: 3px solid #e17055;
            border-radius: 15px;
            padding: 20px;
            margin: 20px 0;
            position: relative;
        }
        .warning-box::before {
            content: "⚠️";
            font-size: 2em;
            position: absolute;
            top: 15px;
            right: 20px;
        }
        .chef-emoji {
            font-size: 1.5em;
            margin: 0 8px;
        }
        .empty-state {
            text-align: center;
            padding: 60px 20px;
            color: #27ae60;
        }
        .empty-state h3 {
            font-size: 2em;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- 🏪 RESTAURANT INSPECTION HEADER -->
        <div class="header">
            <h1>🏪 Empty Restaurant Kitchen Cleanup</h1>
            <p>Chef's Professional Cost Optimization Inspection</p>
            <p class="chef-subtitle">"Closing ghost kitchens and reclaiming your culinary budget!"</p>
            <p><span class="chef-emoji">📅</span>Inspection Date: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')</p>
            <p><span class="chef-emoji">👨‍🍳</span>Conducted by: CloudCostChef Restaurant Inspector</p>
        </div>
        
        <!-- 💎 EXECUTIVE SUMMARY CARDS -->
        <div class="summary">
            <div class="summary-card">
                <h3>👻 Ghost Kitchens Found</h3>
                <div class="value">$($results.Count)</div>
                <div class="description">Empty kitchens bleeding money</div>
            </div>
            <div class="summary-card">
                <h3>🏪 Restaurant Chains Affected</h3>
                <div class="value">$($subscriptionSummary.Count)</div>
                <div class="description">Subscriptions with waste</div>
            </div>
            <div class="summary-card savings">
                <h3>💰 Monthly Kitchen Savings</h3>
                <div class="value">`$$($totalMonthlySavings.ToString('F2'))</div>
                <div class="description">Reclaim this every month!</div>
            </div>
            <div class="summary-card savings">
                <h3>🎉 Annual Budget Recovery</h3>
                <div class="value">`$$($($totalMonthlySavings * 12).ToString('F2'))</div>
                <div class="description">Yearly savings potential</div>
            </div>
        </div>
        
        <div class="content">
"@

# 🏪 ADD RESTAURANT CHAIN SUMMARY OR CELEBRATION MESSAGE
if ($results.Count -eq 0) {
    $htmlContent += @"
            <!-- 🎉 NO GHOST KITCHENS FOUND - CELEBRATION MESSAGE -->
            <div class="empty-state">
                <h3>🎉 Congratulations, Chef!</h3>
                <p><strong>No ghost kitchens found in your restaurant empire!</strong></p>
                <p>🏆 Your Azure App Service Plans are all efficiently utilized.</p>
                <p>👨‍🍳 Your restaurant management is exemplary - no wasted kitchen space!</p>
                <p>🌟 Keep up the excellent cost optimization work!</p>
            </div>
"@
} else {
    $htmlContent += @"
            <!-- 🏪 RESTAURANT CHAIN BREAKDOWN SECTION -->
            <div class="section">
                <h2>Restaurant Chain Breakdown</h2>
                <p><em>Here's how much each restaurant chain is losing to ghost kitchens:</em></p>
                <table>
                    <thead>
                        <tr>
                            <th>🏪 Restaurant Chain Name</th>
                            <th>🆔 Chain ID</th>
                            <th>👻 Ghost Kitchens</th>
                            <th>💸 Monthly Waste</th>
                            <th>💰 Annual Loss</th>
                        </tr>
                    </thead>
                    <tbody>
"@

    # Add restaurant chain summary rows
    foreach ($subId in $subscriptionSummary.Keys) {
        $sub = $subscriptionSummary[$subId]
        $htmlContent += @"
                        <tr>
                            <td>$($sub.Name)</td>
                            <td>$subId</td>
                            <td>$($sub.Count)</td>
                            <td class="cost">`$$($sub.MonthlySavings.ToString('F2'))</td>
                            <td class="cost">`$$($($sub.MonthlySavings * 12).ToString('F2'))</td>
                        </tr>
"@
    }

    $htmlContent += @"
                    </tbody>
                </table>
            </div>
            
            <!-- 📋 DETAILED GHOST KITCHEN INVENTORY -->
            <div class="section">
                <h2>Detailed Ghost Kitchen Inventory</h2>
                <p><em>Every empty kitchen that's costing you money - time for some closures!</em></p>
                <table>
                    <thead>
                        <tr>
                            <th>🏪 Restaurant Chain</th>
                            <th>🏷️ Kitchen Name</th>
                            <th>📦 Kitchen District</th>
                            <th>🌍 City Location</th>
                            <th>⭐ Kitchen Tier</th>
                            <th>🔢 Cooking Stations</th>
                            <th>📊 Status</th>
                            <th>💸 Monthly Rent</th>
                            <th>💰 Annual Cost</th>
                        </tr>
                    </thead>
                    <tbody>
"@

    # Add detailed ghost kitchen results
    foreach ($result in $results) {
        # Add kitchen type emoji based on pricing tier
        $tierDisplay = switch ($result.PricingTier) {
            'F1' { "🆓 $($result.PricingTier)" }
            {$_ -like 'D*'} { "🍕 $($result.PricingTier)" }
            {$_ -like 'B*'} { "🍔 $($result.PricingTier)" }
            {$_ -like 'S*'} { "🍷 $($result.PricingTier)" }
            {$_ -like 'P*'} { "⭐ $($result.PricingTier)" }
            {$_ -like 'I*'} { "🏰 $($result.PricingTier)" }
            {$_ -like 'WS*'} { "🔄 $($result.PricingTier)" }
            default { "🤷‍♂️ $($result.PricingTier)" }
        }
        
        $htmlContent += @"
                        <tr>
                            <td>$($result.SubscriptionName)</td>
                            <td>$($result.AppServicePlanName)</td>
                            <td>$($result.ResourceGroup)</td>
                            <td>$($result.Location)</td>
                            <td><span class="tier">$tierDisplay</span></td>
                            <td>$($result.Capacity)</td>
                            <td>$($result.Status)</td>
                            <td class="cost">`$$($result.EstimatedMonthlyCost.ToString('F2'))</td>
                            <td class="cost">`$$($result.EstimatedAnnualCost.ToString('F2'))</td>
                        </tr>
"@
    }

    $htmlContent += @"
                    </tbody>
                </table>
            </div>
"@
}

# 🎯 CHEF'S PROFESSIONAL RECOMMENDATIONS SECTION
$htmlContent += @"
            <!-- 👨‍🍳 CHEF'S PROFESSIONAL RECOMMENDATIONS -->
            <div class="warning-box">
                <h3>👨‍🍳 Chef's Professional Kitchen Closure Recommendations</h3>
                <ul style="text-align: left; padding-left: 20px;">
                    <li><strong>🔍 Final Inspection:</strong> Double-check these kitchens aren't being prepared for upcoming restaurant openings</li>
                    <li><strong>📋 Review Dependencies:</strong> Some kitchens might be reserved for seasonal menus or special events</li>
                    <li><strong>🗓️ Staged Closure:</strong> Close the most expensive ghost kitchens first for immediate savings</li>
                    <li><strong>🚨 Alert System:</strong> Set up monitoring to catch new ghost kitchens within 30 days</li>
                    <li><strong>🏷️ Kitchen Labeling:</strong> Implement consistent tagging to identify kitchen purposes and owners</li>
                    <li><strong>📊 Regular Audits:</strong> Schedule monthly ghost kitchen inspections to prevent future waste</li>
                    <li><strong>💡 Pro Chef Tip:</strong> Always verify with development teams before closing any premium kitchens!</li>
                </ul>
                <p><strong>Remember:</strong> A properly managed restaurant empire has no ghost kitchens!</p>
            </div>
        </div>
        
        <!-- 🍽️ RESTAURANT FOOTER CREDITS -->
        <div class="footer">
            <p><strong>🏪 Empty Restaurant Kitchen Cleanup</strong> - Professional Inspection by CloudCostChef</p>
            <p><strong>Generated:</strong> $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') | <strong>Inspector:</strong> CloudCostChef Restaurant Management</p>
            <p><em><strong>Note:</strong> Cost estimates based on standard Azure pricing - your regional rates may vary.</em></p>
            <p><strong>Recommendation:</strong> Review each ghost kitchen carefully before closure to ensure no future restaurant plans.</p>
            <button class="export-btn" onclick="window.print()">🖨️ Print Kitchen Closure Report</button>
            <p style="margin-top: 20px;"><strong>🌟 "A clean restaurant empire is a profitable empire!" - CloudCostChef 🌟</strong></p>
        </div>
    </div>
    
    <script>
        // 🎭 ADD INTERACTIVE RESTAURANT INSPECTION FEATURES
        console.log('🏪 CloudCostChef Restaurant Inspector loaded!');
        
        // Make table rows clickable for detailed inspection
        document.querySelectorAll('tbody tr').forEach(row => {
            row.addEventListener('click', function() {
                // Toggle highlight for selected ghost kitchen
                if (this.style.backgroundColor === 'rgb(255, 249, 196)') {
                    this.style.backgroundColor = '';
                    console.log('👻 Ghost kitchen deselected for closure');
                } else {
                    this.style.backgroundColor = '#fff9c4';
                    console.log('👻 Ghost kitchen selected for closure');
                }
            });
        });
        
        // Add kitchen type tooltips (future enhancement)
        console.log('💡 Interactive features ready - click any ghost kitchen to mark for closure!');
    </script>
</body>
</html>
"@

# 🍽️ SERVE THE FINAL INSPECTION REPORT - Save and Present Results
try {
    Write-Host "🍽️  Finalizing restaurant kitchen closure report..." -ForegroundColor Yellow
    $htmlContent | Out-File -FilePath $OutputPath -Encoding UTF8
    Write-Host "✅ Kitchen closure report successfully prepared!" -ForegroundColor Green
    
    # 🎊 CHEF'S FINAL PRESENTATION - Display Results with Restaurant Flair
    Write-Host "`n" -NoNewline
    Write-Host "🎉 ═══════════════════════════════════════════════════════════════ 🎉" -ForegroundColor Green
    Write-Host "🏪            EMPTY RESTAURANT KITCHEN CLEANUP COMPLETE!            🏪" -ForegroundColor Green  
    Write-Host "🎉 ═══════════════════════════════════════════════════════════════ 🎉" -ForegroundColor Green

    Write-Host "`n👨‍🍳 Restaurant Inspector's Summary:" -ForegroundColor Cyan
    Write-Host "   📄 Kitchen closure report filed: $OutputPath" -ForegroundColor Yellow
    
    if ($results.Count -eq 0) {
        Write-Host "   🎉 CONGRATULATIONS! No ghost kitchens found!" -ForegroundColor Green
        Write-Host "   🏆 Your restaurant empire is perfectly optimized!" -ForegroundColor Green
        Write-Host "   💰 No wasted kitchen rent - you're a model restaurant manager!" -ForegroundColor Green
    } else {
        Write-Host "   👻 Ghost kitchens discovered: $($results.Count)" -ForegroundColor Red
        Write-Host "   💸 Monthly kitchen waste: `$$($totalMonthlySavings.ToString('F2'))" -ForegroundColor Red
        Write-Host "   🎊 Annual savings opportunity: `$$($($totalMonthlySavings * 12).ToString('F2'))" -ForegroundColor Green
        
        Write-Host "`n🏪 RESTAURANT EMPIRE ANALYSIS:" -ForegroundColor Magenta
        Write-Host "   🏢 Restaurant chains audited: $($subscriptionSummary.Count)" -ForegroundColor White
        Write-Host "   👻 Total ghost kitchens bleeding money: $($results.Count)" -ForegroundColor White
        Write-Host "   💰 Biggest monthly savings opportunity: `$$($totalMonthlySavings.ToString('F2'))" -ForegroundColor White
        
        # Find most expensive ghost kitchen
        $mostExpensive = $results | Sort-Object EstimatedMonthlyCost -Descending | Select-Object -First 1
        if ($mostExpensive) {
            Write-Host "   🎯 Most expensive ghost kitchen: '$($mostExpensive.AppServicePlanName)' (`$$($mostExpensive.EstimatedMonthlyCost.ToString('F2'))/month)" -ForegroundColor Yellow
        }
        
        Write-Host "`n💡 Chef's Professional Recommendation:" -ForegroundColor Yellow
        Write-Host "   Start by closing the highest-tier ghost kitchens for immediate impact!" -ForegroundColor White
        Write-Host "   These empty restaurant kitchens are bleeding real money every month! 🩸💰" -ForegroundColor White
    }
    
    # 🍷 OFFER THE GRAND PRESENTATION - Ask to Open Report
    if ($OpenReport) {
        Write-Host "`n🍽️  Opening your restaurant kitchen closure report..." -ForegroundColor Green
        Start-Process $OutputPath
        Write-Host "🌟 Review your ghost kitchens and start reclaiming that budget! 🌟" -ForegroundColor Green
    } else {
        Write-Host "`n🍽️  Your kitchen closure report is ready for review!" -ForegroundColor Yellow
        Write-Host "📄 Open this file to see the full inspection: $OutputPath" -ForegroundColor Cyan
    }
    
} catch {
    Write-Error "🚨 Failed to generate kitchen closure report: $($_.Exception.Message)"
    Write-Host "🔧 Please check file permissions and try again!" -ForegroundColor Red
}

Write-Host "`n👨‍🍳 Thank you for choosing CloudCostChef Restaurant Management!" -ForegroundColor Magenta
Write-Host "🏪 Remember: A well-managed restaurant empire has no ghost kitchens! 🏪" -ForegroundColor Green
Write-Host "💰 Every closed ghost kitchen is money back in your culinary budget! 💰" -ForegroundColor Green
