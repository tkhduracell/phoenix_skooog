import EctoEnum

defenum UserTypeEnum, :user_type, ["SuperAdmin", 
                                   "Admin",
                                   "Internal",
                                   "External"]

defenum ObjectTypeEnum, :object_type, ["Slutavverkning",
                                       "Gallring",
                                       "Risskotning", 
                                       "Naturreservat", 
                                       "Ledningsgata",
                                       "Övrigt risobjekt",
                                       "Annat/Övrigt",
                                       "Entreprenadkörning"]

defenum ObjectBusinessStatusEnum, :object_business_status, ["Anbud/ej färdigt köp", 
                                                            "Färdigt köp"]

defenum ObjectDelegationStatusEnum, :object_delegation_status, ["Ej delegerad",
                                                                "Vänta med delegering",
                                                                "Gör delegering möjlig",
                                                                "Delegering utförd"]