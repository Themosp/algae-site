PageGroupsPage.
    where(page_id: Page.find('welcome').id, page_group_id: PageGroup.find('company').id).
    first_or_create!(order: 1)
PageGroupsPage.
    where(page_id: Page.find('vision').id, page_group_id: PageGroup.find('company').id).
    first_or_create!(order: 2)
PageGroupsPage.
    where(page_id: Page.find('facilities').id, page_group_id: PageGroup.find('company').id).
    first_or_create!(order: 3)

PageGroupsPage.
    where(page_id: Page.find('pellets').id, page_group_id: PageGroup.find('products').id).
    first_or_create!(order: 1)
PageGroupsPage.
    where(page_id: Page.find('oil').id, page_group_id: PageGroup.find('products').id).
    first_or_create!(order: 2)
PageGroupsPage.
    where(page_id: Page.find('briquettes').id, page_group_id: PageGroup.find('products').id).
    first_or_create!(order: 3)
PageGroupsPage.
    where(page_id: Page.find('certifications').id, page_group_id: PageGroup.find('products').id).
    first_or_create!(order: 4)
