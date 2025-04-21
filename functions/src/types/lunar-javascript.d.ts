declare module 'lunar-javascript' {
  export interface LunarDate {
    getYear(): number;
    getMonth(): number;
    getDay(): number;
    isLeap: boolean;
    getSolar(): SolarDate;
  }

  export interface SolarDate {
    getYear(): number;
    getMonth(): number;
    getDay(): number;
    getLunar(): LunarDate;
  }

  export interface LunarType {
    fromYmd(year: number, month: number, day: number, isLeap?: boolean): LunarDate;
    fromDate?(date: Date): LunarDate;
  }

  export interface SolarType {
    fromDate(date: Date): SolarDate;
    fromYmd(year: number, month: number, day: number): SolarDate;
  }

  export interface LunarUtilType {
    getDaysOfMonth(year: number, month: number, isLeap: boolean): number;
  }

  // The actual export objects 
  export const Lunar: LunarType;
  export const Solar: SolarType;
  export const LunarUtil: LunarUtilType;
  
  // Optional default export
  export default function(): any;
}