declare module '@apiverve/birthchart' {
  export interface birthchartOptions {
    api_key: string;
    secure?: boolean;
  }

  /**
   * Describes fields the current plan does not unlock. Locked fields arrive as null
   * in `data`; `locked_fields` names them, using dot paths for nested fields.
   * Absent when the plan unlocks everything.
   */
  export interface PremiumInfo {
    message: string;
    upgrade_url: string;
    locked_fields: string[];
  }

  export interface birthchartResponse {
    status: string;
    error: string | null;
    data: BirthChartData;
    code?: number;
    premium?: PremiumInfo;
  }


  interface BirthChartData {
      birth:       Birth;
      houseSystem: null | string;
      sunSign:     null | string;
      moonSign:    null | string;
      risingSign:  null | string;
      ascendant:   Ascendant;
      midheaven:   Ascendant;
      planets:     Planet[];
      houses:      Ascendant[];
      aspects:     Aspect[];
      elements:    Elements;
      modalities:  Modalities;
  }
  
  interface Ascendant {
      sign:      null | string;
      degree:    number | null;
      longitude: number | null;
      formatted: null | string;
      house?:    number | null;
  }
  
  interface Aspect {
      planet1:  null | string;
      planet2:  null | string;
      aspect:   null | string;
      angle:    number | null;
      orb:      number | null;
      applying: boolean | null;
  }
  
  interface Birth {
      localTime:    null | string;
      utcTime:      Date | null;
      timezone:     null | string;
      utcOffset:    null | string;
      offsetSource: null | string;
      latitude:     number | null;
      longitude:    number | null;
  }
  
  interface Elements {
      fire:  number | null;
      earth: number | null;
      air:   number | null;
      water: number | null;
  }
  
  interface Modalities {
      cardinal: number | null;
      fixed:    number | null;
      mutable:  number | null;
  }
  
  interface Planet {
      name:       null | string;
      sign:       null | string;
      degree:     number | null;
      longitude:  number | null;
      formatted:  null | string;
      house:      number | null;
      retrograde: boolean | null;
      speed:      number | null;
  }

  export default class birthchartWrapper {
    constructor(options: birthchartOptions);

    execute(callback: (error: any, data: birthchartResponse | null) => void): Promise<birthchartResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: birthchartResponse | null) => void): Promise<birthchartResponse>;
    execute(query?: Record<string, any>): Promise<birthchartResponse>;
  }
}
