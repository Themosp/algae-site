PageGroup.
    where(slug: "company").
    first_or_create!(title: "Η εταιρεία")
PageGroup.
    where(slug: "products").
    first_or_create!(title: "Προϊόντα")
