import { TitleLink } from 'types/TitleLink';
import { EntityPropertySchema } from 'types/EntityProperty';

export abstract class Configs {
  static managerPath: string;
  static resourceUrl: string;
  static createTitle: string;
  static updateTitle: string;
  static manageTitle: string;
  static manageTitleLinks: TitleLink[];
  static properties: EntityPropertySchema;
  static initialCreateUpdateFormValues: object;
  static createUpdateFormSchema: object;
}