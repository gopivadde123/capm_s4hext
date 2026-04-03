using s4hext.cus_mat.srv.CatalogService as service from '../../srv/CatalogService';
annotate service.MyCustomerMaterial with @odata.draft.enabled;
// annotate service.MyCustomerMaterial with @Capabilities.InsertRestrictions.Insertable: true;
// annotate service.MyCustomerMaterial with @UI.CreateHidden: false;
annotate service.MyCustomerMaterial with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'SalesOrganization',
                Value : SalesOrganization,
            },
            {
                $Type : 'UI.DataField',
                Label : 'DistributionChannel',
                Value : DistributionChannel,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Customer',
                Value : Customer,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Material',
                Value : Material,
            },
            {
                $Type : 'UI.DataField',
                Label : 'MaterialByCustomer',
                Value : MaterialByCustomer,
            },
            {
                $Type : 'UI.DataField',
                Label : 'MaterialDescriptionByCustomer',
                Value : MaterialDescriptionByCustomer,
            },
            {
                $Type : 'UI.DataField',
                Label : 'RoundingProfile',
                Value : RoundingProfile,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Plant',
                Value : Plant,
            },
            {
                $Type : 'UI.DataField',
                Label : 'DeliveryPriority',
                Value : DeliveryPriority,
            },
            {
                $Type : 'UI.DataField',
                Label : 'MinDeliveryQtyInBaseUnit',
                Value : MinDeliveryQtyInBaseUnit,
            },
            {
                $Type : 'UI.DataField',
                Label : 'BaseUnit',
                Value : BaseUnit,
            },
            {
                $Type : 'UI.DataField',
                Label : 'PartialDeliveryIsAllowed',
                Value : PartialDeliveryIsAllowed,
            },
            {
                $Type : 'UI.DataField',
                Label : 'MaxNmbrOfPartialDelivery',
                Value : MaxNmbrOfPartialDelivery,
            },
            {
                $Type : 'UI.DataField',
                Label : 'UnderdelivTolrtdLmtRatioInPct',
                Value : UnderdelivTolrtdLmtRatioInPct,
            },
            {
                $Type : 'UI.DataField',
                Label : 'OverdelivTolrtdLmtRatioInPct',
                Value : OverdelivTolrtdLmtRatioInPct,
            },
            {
                $Type : 'UI.DataField',
                Label : 'UnlimitedOverdeliveryIsAllowed',
                Value : UnlimitedOverdeliveryIsAllowed,
            },
            {
                $Type : 'UI.DataField',
                Label : 'CustomerMaterialItemUsage',
                Value : CustomerMaterialItemUsage,
            },
            {
                $Type : 'UI.DataField',
                Label : 'SalesUnit',
                Value : SalesUnit,
            },
            {
                $Type : 'UI.DataField',
                Label : 'SalesQtyToBaseQtyDnmntr',
                Value : SalesQtyToBaseQtyDnmntr,
            },
            {
                $Type : 'UI.DataField',
                Label : 'SalesQtyToBaseQtyNmrtr',
                Value : SalesQtyToBaseQtyNmrtr,
            },
            {
                $Type : 'UI.DataField',
                Label : 'CustomerMaterialSearchTerm',
                Value : CustomerMaterialSearchTerm,
            },
            {
                $Type : 'UI.DataField',
                Label : 'ETag',
                Value : ETag,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Material',
            Value : Material,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Customer',
            Value : Customer,
        },
        {
            $Type : 'UI.DataField',
            Label : 'DistributionChannel',
            Value : DistributionChannel,
        },
        {
            $Type : 'UI.DataField',
            Label : 'SalesOrganization',
            Value : SalesOrganization,
        },
        {
            $Type : 'UI.DataField',
            Label : 'MaterialByCustomer',
            Value : MaterialByCustomer,
        },
    ],
);

